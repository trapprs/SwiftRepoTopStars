//
//  RepositoryWapper.swift
//  SwiftTopStars
//
//  Created by Renan Trapp on 12/08/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import Foundation

struct RepositoryWapper: Codable {
    var totalCount: Int
    var incompleteResults: Bool
    var items: [Repository]
    
    init(totalCount: Int, incompleteResults: Bool,items: [Repository]) {
        self.totalCount = totalCount
        self.incompleteResults = incompleteResults
        self.items = items
    }
}

enum RepositoryWapperKeys: String, CodingKey {
    case totalCount = "total_count"
    case incompleteResults = "incomplete_results"
    case items = "items"
}

extension RepositoryWapper {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RepositoryWapperKeys.self)
        self.totalCount = try container.decode(Int.self, forKey: .totalCount)
        self.incompleteResults = try container.decode(Bool.self, forKey: .incompleteResults)
        self.items =  try container.decode([Repository].self, forKey: .items)
    }
}
