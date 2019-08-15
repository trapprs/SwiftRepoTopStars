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
    var dataPrefetchDelegate: DataPrefetchDelegate?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TopRatedRepoTableViewCell.reuseID, for: indexPath) as? TopRatedRepoTableViewCell else { return UITableViewCell() }
        let repository = self.items[indexPath.row]
        let positionRepository = indexPath.row + 1
        cell.setup(repository: repository, position: positionRepository)
        
        return cell
    }
    
    init(items: [Repository],
         tableView: UITableView,
         delegate: UITableViewDelegate,
         dataPrefetchDelegate: DataPrefetchDelegate) {
        self.items = items
        self.tableView = tableView
        self.delegate = delegate
        self.dataPrefetchDelegate = dataPrefetchDelegate
        super.init()
        let nib = UINib.init(nibName: TopRatedRepoTableViewCell.reuseID,
                             bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: TopRatedRepoTableViewCell.reuseID)
        tableView.tableFooterView = UIView()
        tableView.prefetchDataSource = self
        self.setup()
    }
}

protocol RepositorysDelegate {
    func didSelectCharacter(at index: IndexPath)
    func didStartToSwipe(_ yPosition: CGFloat, direction: DirectionYTableView)
}

protocol DataPrefetchDelegate: Any {
    func loadNextPage()
}

final class RepositoryTableDelegate: NSObject, UITableViewDelegate {
    let delegate: RepositorysDelegate
    private var lastPositionTableView: CGFloat?
    
    // MARK: - Initialization
    init(_ delegate: RepositorysDelegate) {
        self.delegate = delegate
    }
    
    // MARK: - Functions
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
        lastPositionTableView = scrollView.contentOffset.y
        delegate.didStartToSwipe(scrollView.contentOffset.y, direction: direction)
    }
}

extension RepositoryDatasource: UITableViewDataSourcePrefetching {
    func isLoadingCell(for indexPath: IndexPath) -> Bool {
        return indexPath.row >= items.count - 1
    }
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        if indexPaths.contains(where: isLoadingCell) {
            dataPrefetchDelegate?.loadNextPage()
        }
    }
}

enum DirectionYTableView {
    case up
    case down
}
