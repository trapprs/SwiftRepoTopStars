//
//  TopRatedViewControllerTests.swift
//  SwiftTopStarsTests
//
//  Created by Renan Trapp Silva on 17/08/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import XCTest
@testable import SwiftTopStars

class TopRatedViewControllerTests: XCTestCase {
    private var topRatedViewModelSpy: TopRatedViewModelSpy!
    var viewController: TopRatedReposViewController!
    
    override func setUp() {
        super.setUp()
        
        self.topRatedViewModelSpy = TopRatedViewModelSpy()
        self.viewController = TopRatedReposViewController(viewModel: topRatedViewModelSpy)
        self.viewController.viewDidLoad()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testInitalization() {
        XCTAssertNotNil(viewController)
    }
    
    func testLoadRepos() {
        let delayExpectation = expectation(description: "Waiting...")
        viewController.viewWillAppear(true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            delayExpectation.fulfill()
        }
        waitForExpectations(timeout: 3)
    
        XCTAssertNotNil(topRatedViewModelSpy.repos.value)
    }
    
    func testLoadNextPage() {
        viewController.loadNextPage()
        
        XCTAssert(topRatedViewModelSpy.shouldLoadNextPage)
    }
    
    func testSelectRepo() {
        viewController.didSelectRepo(at: IndexPath(item: 0, section: 1))
        
        XCTAssert(topRatedViewModelSpy.shouldGoToDetail)
    }
    
    func testSwipeDirection() {
        viewController.didStartToSwipe(direction: .up)
        viewController.didStartToSwipe(direction: .down)
        viewController.refreshControl.beginRefreshing()
        
        XCTAssert(viewController.refreshControl.isRefreshing)
        viewController.refreshControl.endRefreshing()
        XCTAssertFalse(viewController.refreshControl.isRefreshing)
    }
}

private class TopRatedViewModelSpy: TopRatedReposViewModelProtocol {
    var repos: Dynamic<[Repository]> = Dynamic([])
    var error: Dynamic<String?> = Dynamic(nil)
    var isLoading: Dynamic<Bool> = Dynamic(false)
    var shouldLoadNextPage = false
    var shouldGoToDetail = false
    func loadRepos() {
        repos.value = ReposMock().repos
    }
    
    func loadNextRepos() {
        shouldLoadNextPage = true
    }
    
    func restartRepos() {
        loadRepos()
    }
    
    func goToDetails(index: IndexPath) {
        shouldGoToDetail = true
    }
}
