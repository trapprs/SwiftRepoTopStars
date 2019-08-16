//
//  RepositoryTableDelegate.swift
//  SwiftTopStars
//
//  Created by Renan Trapp on 16/08/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import UIKit

protocol RepositorysDelegate {
    func didSelectCharacter(at index: IndexPath)
    func didStartToSwipe(direction: DirectionYTableView)
}

final class RepositoryTableDelegate: NSObject, UITableViewDelegate {
    let delegate: RepositorysDelegate
    private var lastPositionTableView: CGFloat?
    private var lastContentSize: CGFloat?
    private var lastPosition: DirectionYTableView = .down {
        didSet {
            delegate.didStartToSwipe(direction: lastPosition)
        }
    }
    
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
        if
            let lastPositionTableView = lastPositionTableView,
            let lastContentSize = lastContentSize {
            
            if lastPositionTableView > scrollView.contentOffset.y,
                lastPositionTableView < 50,
                lastPosition != .down {
                 lastPosition = .down
            } else
                if lastPositionTableView < scrollView.contentOffset.y,
                    scrollView.contentOffset.y > 0,
                    lastContentSize == scrollView.contentSize.height,
                    lastPosition != .up {
                        lastPosition = .up
                }
        }
        lastPositionTableView = scrollView.contentOffset.y
        lastContentSize = scrollView.contentSize.height
    }
}

