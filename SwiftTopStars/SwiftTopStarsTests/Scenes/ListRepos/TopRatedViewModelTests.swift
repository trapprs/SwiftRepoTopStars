//
//  TopRatedViewModelTests.swift
//  SwiftTopStarsTests
//
//  Created by Renan Trapp on 16/08/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import XCTest
@testable import SwiftTopStars

class TopRatedViewModelTests: XCTestCase {
    private var navigation: NavigationSpy!
    var topRatedReposViewModel: TopRatedReposViewModel!
    
    override func setUp() {
        super.setUp()
        
        let service = ListReposServiceMock()
        
        self.navigation = NavigationSpy()
        
        topRatedReposViewModel = TopRatedReposViewModel(service: service, navigationDelegate: navigation)
    }

    func testInit() {
        XCTAssertNotNil(topRatedReposViewModel)
    }
    
    func testRepos() {
        topRatedReposViewModel.loadRepos()
        topRatedReposViewModel.loadNextRepos()
        print(topRatedReposViewModel.repos)
        XCTAssertNotNil(topRatedReposViewModel.repos.value)
    }
    
    func testGoToDetails() {
        let delayExpectation = expectation(description: "Waiting for document to be saved")
        topRatedReposViewModel.loadRepos()
        
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.topRatedReposViewModel.goToDetails(index: IndexPath(index: 1))
            delayExpectation.fulfill()
            
        }
        waitForExpectations(timeout: 5)
        XCTAssert(self.navigation.shouldGoToDetails)
        
        
    }
    override func tearDown() {
        super.tearDown()
    }
}

private class NavigationSpy: TopRatedRepoNavigationProtocol {
    var shouldGoToDetails = false
    
    func goToDetails(of repo: Repository) {
        shouldGoToDetails = true
    }
}
