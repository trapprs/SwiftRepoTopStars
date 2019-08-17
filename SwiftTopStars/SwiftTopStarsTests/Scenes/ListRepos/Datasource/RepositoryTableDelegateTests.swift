//
//  RepositoryTableDelegateTests.swift
//  SwiftTopStarsTests
//
//  Created by Renan Trapp Silva on 17/08/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import XCTest
@testable import SwiftTopStars

class RepositoryTableDelegateTests: XCTestCase {
    var repositoryTableDelegate: RepositoryTableDelegate!
    var shouldSelectRepo = false
    var shouldGoToDirection: DirectionYTableView = .up
    
    override func setUp() {
        super.setUp()
        
        repositoryTableDelegate = RepositoryTableDelegate(self)
    }

    override func tearDown() {
        repositoryTableDelegate = nil
        
        super.tearDown()
    }

    func testDidSelectRepo() {
        repositoryTableDelegate.tableView(UITableView(),
                                          didSelectRowAt: IndexPath(item: 0, section: 1))
        
        XCTAssert(shouldSelectRepo)
    }
    
    func testSwipe() {
        let swipe = UIScrollView(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        swipe.contentOffset.y = 20
        repositoryTableDelegate.scrollViewDidScroll(swipe)
        swipe.contentOffset.y = 50
        repositoryTableDelegate.scrollViewDidScroll(swipe)
        XCTAssert(shouldGoToDirection == .up)
        swipe.contentOffset.y = 40
        repositoryTableDelegate.scrollViewDidScroll(swipe)
        swipe.contentOffset.y = 39
        repositoryTableDelegate.scrollViewDidScroll(swipe)
        XCTAssert(shouldGoToDirection == .down)
    }
}

extension RepositoryTableDelegateTests: RepositorysDelegate {
    func didSelectRepo(at index: IndexPath) {
        shouldSelectRepo = true
    }
    
    func didStartToSwipe(direction: DirectionYTableView) {
        self.shouldGoToDirection = direction
    }
}
