//
//  License.swift
//  SwiftTopStars
//
//  Created by Renan Trapp on 12/08/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import Foundation

struct License: Codable {
    var key: String?
    var name: String?
    var spdxId: String?
    var url: String?
    var nodeId: String
}

enum LicenseKeys: String, CodingKey {
    case key = "key"
    case name = "name"
    case spdxId = "spdx_id"
    case url = "url"
    case nodeId = "node_id"
}

extension License {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: LicenseKeys.self)
        self.key = try container.decodeIfPresent(String.self, forKey: .key)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.spdxId = try container.decodeIfPresent(String.self, forKey: .spdxId)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
        self.nodeId = try container.decode(String.self, forKey: .spdxId)
    }
}
