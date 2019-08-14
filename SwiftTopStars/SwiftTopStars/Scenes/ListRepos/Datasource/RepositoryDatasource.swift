//
//  RepositoryDatasource.swift
//  SwiftTopStars
//
//  Created by Renan Trapp on 13/08/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import UIKit

final class RepositoryDatasource: NSObject, ItemsTableViewDatasource {
    var items:[Repository] = []
    var delegate: UITableViewDelegate?
    var tableView: UITableView?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TopRatedRepoTableViewCell.reuseID, for: indexPath) as? TopRatedRepoTableViewCell else { return UITableViewCell() }
        let repository = self.items[indexPath.row]
        cell.setup(repository: repository)
        
        return cell
    }
    
    init(items: [Repository], tableView: UITableView, delegate: UITableViewDelegate) {
        self.items = items
        self.tableView = tableView
        self.delegate = delegate
        super.init()
        let nib = UINib.init(nibName: TopRatedRepoTableViewCell.reuseID,
                             bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: TopRatedRepoTableViewCell.reuseID)
        tableView.tableFooterView = UIView()
        
        self.setup()
    }
}

protocol RepositorysDelegate {
    func didSelectCharacter(at index: IndexPath)
    func didStartToSwipe(_ yPosition: CGFloat, direction: DirectionYTableView)
}

class RepositoryTableDelegate: NSObject, UITableViewDelegate {
    let delegate: RepositorysDelegate
    private var lastPositionTableView: CGFloat?
    
    init(_ delegate: RepositorysDelegate) {
        self.delegate = delegate
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95.0
    }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.didSelectCharacter(at: indexPath)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var direction: DirectionYTableView = .up
       
        if let lastPositionTableView = lastPositionTableView {
            if scrollView.contentOffset.y > lastPositionTableView {
                direction = .up
            } else if scrollView.contentOffset.y < scrollView.contentSize.height - scrollView.frame.height {
               direction = .down
            }
        } else {
            direction = .down
        }

        delegate.didStartToSwipe(scrollView.contentOffset.y, direction: direction)
        lastPositionTableView = scrollView.contentOffset.y
    }
}

enum DirectionYTableView {
    case up
    case down
}
