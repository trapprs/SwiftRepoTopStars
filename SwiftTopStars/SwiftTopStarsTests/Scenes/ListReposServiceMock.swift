//
//  ListReposServiceMock.swift
//  SwiftTopStarsTests
//
//  Created by Renan Trapp on 15/08/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import Foundation
@testable import SwiftTopStars

class ListReposServiceMock: GitHubRepoServiceProtocol {
    let repositoryWapperMock: RepositoryWapper? = RepositoryWapper(totalCount: 0, incompleteResults: false, items: [])
    
    func getTopStars(page: Int, completion: @escaping (Result<RepositoryWapper?, APIError>) -> Void) {
    }
}

