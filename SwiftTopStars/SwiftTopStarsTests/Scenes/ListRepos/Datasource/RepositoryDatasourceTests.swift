//
//  RepositoryDatasourceTests.swift
//  SwiftTopStarsTests
//
//  Created by Renan Trapp on 16/08/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import XCTest
@testable import SwiftTopStars

class RepositoryDatasourceTests: XCTestCase {
    var repositoryDatasource: RepositoryDatasource!
    private var repositoryDatasourceSpy: RepositoryDatasourceSpy!

    override func setUp() {
        super.setUp()
        
        self.repositoryDatasourceSpy = RepositoryDatasourceSpy()
        let repositorysDelegate =  RepositoryTableDelegate(self.repositoryDatasourceSpy)
        
        repositoryDatasource = RepositoryDatasource(items: repositoryDatasourceSpy.repository, tableView: repositoryDatasourceSpy.tableView ?? UITableView(), delegate: repositorysDelegate, dataPrefetchDelegate: repositoryDatasourceSpy, viewModel: TopRatedRepoTableViewCellViewModelSpy())
    }

    func testInitialization() {
        XCTAssertNotNil(repositoryDatasource)
    }
    
    override func tearDown() {
       super.tearDown()
    }
    
    func testDidPass() {
        repositoryDatasourceSpy.didSelectRepo(at: IndexPath(index: 1))
        
        XCTAssert(repositoryDatasourceSpy.shouldPassToDidSelect)
    }
}

private class RepositoryDatasourceSpy {
    let repository: [Repository] = ReposMock().repos
    let tableView: UITableView?
    var shouldPassToDidSelect = false
    var shouldPassToSwipe = false
    
    init() {
        tableView = UITableView(frame: .zero)
    }
}

extension RepositoryDatasourceSpy: RepositorysDelegate {
    func didSelectRepo(at index: IndexPath) {
        shouldPassToDidSelect = true
    }
    
    func didStartToSwipe(direction: DirectionYTableView) {
        shouldPassToSwipe = true
    }
}
extension RepositoryDatasourceSpy: DataPrefetchDelegate {
    func loadNextPage() {
        
    }
}

private class TopRatedRepoTableViewCellViewModelSpy: TopRatedRepoTableViewCellViewModelProtocol {
    var repository: Repository?
    
    func getImage(from url: String?, completion: @escaping (UIImage) -> Void) {
    }
}
