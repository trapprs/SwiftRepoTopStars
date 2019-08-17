//
//  TopRatedRepoNetwork.swift
//  SwiftTopStars
//
//  Created by Renan Trapp on 07/08/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import Foundation

enum TopRatedRepo {
    case top(page: Int)
}

extension TopRatedRepo: EndPoint {
    var base: String {
        return "https://api.github.com/search/repositories"
    }
    
    var path: String {
        switch self {
        case .top(let pages):
          return "page=\(pages)"
        }
    }
}
