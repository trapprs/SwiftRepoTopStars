//
//  APIError.swift
//  SwiftTopStars
//
//  Created by Renan Trapp on 07/08/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import Foundation

enum APIError: Error {
    case requestFailed
    case jsonConversionFailure
    case invalidData
    case responseUnsuccessful
    case jsonParsingFailure
    
    var localizedError: String {
        switch self {
        case .requestFailed:
            return "requestFailed"
        case .jsonConversionFailure:
            return "jsonConversionFailure"
        case .invalidData:
            return "invalidData"
        case .responseUnsuccessful:
            return "responseUnsuccessful"
        case .jsonParsingFailure:
            return "jsonParsingFailure"
        }
    }
}
