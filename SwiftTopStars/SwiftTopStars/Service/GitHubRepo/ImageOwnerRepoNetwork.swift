//
//  ImageOwnerRepoNetwork.swift
//  SwiftTopStars
//
//  Created by Renan Trapp on 15/08/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import Foundation

enum ImageOwnerRepo {
    case image(url: String)
}

extension ImageOwnerRepo: EndPoint {
    var base: String {
        switch self {
        case .image(let url):
            return url
        }
    }
    
    var path: String {
       return ""
    }
}
