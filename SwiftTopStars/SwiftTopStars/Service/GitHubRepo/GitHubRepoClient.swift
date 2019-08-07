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
    
//    func getFeed(from movieFeedType: MovieFeed, completion: @escaping (Result<MovieFeedResult?, APIError>) -> Void) {
//        guard let movieFeedTypeRequest = movieFeedType.request else { return }
//        
//        fetch(with: movieFeedTypeRequest, decode: { json -> MovieFeedResult? in
//            guard let movieFeedResult = json as? MovieFeedResult else { return nil }
//            
//            return movieFeedResult
//        }, completion: completion)
//    }
}
