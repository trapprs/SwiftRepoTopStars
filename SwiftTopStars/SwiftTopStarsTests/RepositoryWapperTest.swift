//
//  RepositoryWapperTest.swift
//  SwiftTopStarsTests
//
//  Created by Renan Trapp on 16/08/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import XCTest
@testable import SwiftTopStars

class RepositoryWapperTest: XCTestCase {
    var wapper: RepositoryWapper!
    
    override func setUp() {
        super.setUp()
        
        self.wapper = RepositoryWapper(totalCount: 1, incompleteResults: false, items: ReposMock().repos)
    }

    func testInitialization() {
        XCTAssertNotNil(self.wapper)
    }
    
    override func tearDown() {
        self.wapper = nil
        
        super.tearDown()
    }
}
