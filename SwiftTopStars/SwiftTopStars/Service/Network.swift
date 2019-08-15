//
//  Network.swift
//  SwiftTopStars
//
//  Created by Renan Trapp on 07/08/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import Foundation

enum Result<Data, Err> where Err: Error {
    case success(Data)
    case failure(Err)
}

protocol EndPoint {
    var base: String { get }
    var path: String { get }
}

extension EndPoint {
    var pathQuery: String {
        return "q=language:swift&sort=stars&"
    }
    
    var urlComponents: URLComponents? {
        var components = URLComponents(string: base)
        components!.query = "\(pathQuery)\(path)"
        
        return components
    }
    
    var request: URLRequest? {
        guard let url = urlComponents?.url else {
            return nil
        }
        
        return URLRequest(url: url)
    }
}
