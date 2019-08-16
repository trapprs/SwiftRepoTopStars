//
//  GitHubRepoService.swift
//  SwiftTopStars
//
//  Created by Renan Trapp on 13/08/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import Foundation

protocol GitHubRepoServiceProtocol: AnyObject {
    func getTopStars(page: Int, completion: @escaping(Result<RepositoryWapper?, APIError>) -> Void)
}

class GitHubRepoService: GitHubRepoServiceProtocol {
    func getTopStars(page: Int, completion: @escaping (Result<RepositoryWapper?, APIError>) -> Void) {
        GitHubRepoClient().getRepos(from: .top(page: page)) { result in
           completion(result)
        }
    }
}

