//
//  Network.swift
//  SwiftTopStars
//
//  Created by Renan Trapp on 07/08/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import Foundation

enum Result<data, error> where error: Error {
    case success(data)
    case failure(error)
}

protocol EndPoint {
    var base: String { get }
    var path: String { get }
}
extension EndPoint {
    var urlComponents: URLComponents? {
        var components = URLComponents(string: base)
        components!.path = path
        
        return components
    }
    
    var request: URLRequest? {
        guard let url = urlComponents?.url else {
            return nil
        }
        
        return URLRequest(url: url)
    }
}
