//
//  GitHubRepo.swift
//  SwiftTopStars
//
//  Created by Renan Trapp on 07/08/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import Foundation

class GitHubRepoClient: APIClient {
    var session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    func getRepos(from topRatedRepo: TopRatedRepo, completion: @escaping (Result<RepositoryWapper?, APIError>) -> Void) {
        guard let topRatedRepoRequest = topRatedRepo.request else { return }
        
        fetch(with: topRatedRepoRequest, decode: { json -> RepositoryWapper?  in
            guard let reposResult = json as? RepositoryWapper else { return nil }
            
            return reposResult
        }, completion: completion)
    }
}
