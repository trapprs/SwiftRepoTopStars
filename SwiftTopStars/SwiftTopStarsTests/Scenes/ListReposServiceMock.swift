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
    
    func getTopStars(page: Int, completion: @escaping (Result<RepositoryWapper?, APIError>) -> Void) {
        let result = RepositoryWapper(totalCount: 1, incompleteResults: false, items: ReposMock().repos)
        completion(.success(result))
    }
}

