//
//  Owner.swift
//  SwiftTopStars
//
//  Created by Renan Trapp on 12/08/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import Foundation

struct Owner: Codable {
    var login: String
    var id: Int
    var nodeId: String
    var avatarUrl: String
    var gravatarId: String
    var url: String
    var htmlUrl: String
    var followersUrl: String
    var followingUrl: String
    var gistsUrl: String
    var starredUrl: String
    var subscriptionsUrl: String
    var organizationsUrl: String
    var reposUrl: String
    var eventsUrl: String
    var receivedEventsUrl: String
    var type: String
    var siteAdmin: Bool?
}

enum OwnerKeys: String, CodingKey {
    case login = "login"
    case id = "id"
    case nodeId = "node_id"
    case avatarUrl = "avatar_url"
    case gravatarId = "gravatar_id"
    case url = "url"
    case htmlUrl = "html_url"
    case followersUrl = "followers_url"
    case followingUrl = "following_url"
    case gistsUrl = "gists_url"
    case starredUrl = "starred_url"
    case subscriptionsUrl = "subscriptions_url"
    case organizationsUrl = "organizations_url"
    case reposUrl = "repos_url"
    case eventsUrl = "events_url"
    case receivedEventsUrl = "received_events_url"
    case type = "type"
    case siteAdmin = "site_admin"
}

extension Owner {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: OwnerKeys.self)
        self.login = try container.decode(String.self, forKey: .login)
        self.id = try container.decode(Int.self, forKey: .id)
        self.nodeId = try container.decode(String.self, forKey: .nodeId)
        self.avatarUrl = try container.decode(String.self, forKey: .avatarUrl)
        self.gravatarId = try container.decode(String.self, forKey: .gravatarId)
        self.url = try container.decode(String.self, forKey: .url)
        self.htmlUrl = try container.decode(String.self, forKey: .htmlUrl)
        self.followersUrl = try container.decode(String.self, forKey: .followersUrl)
        self.followingUrl = try container.decode(String.self, forKey: .followingUrl)
        self.gistsUrl = try container.decode(String.self, forKey: .gistsUrl)
        self.starredUrl = try container.decode(String.self, forKey: .starredUrl)
        self.subscriptionsUrl = try container.decode(String.self, forKey: .subscriptionsUrl)
        self.organizationsUrl = try container.decode(String.self, forKey: .organizationsUrl)
        self.reposUrl = try container.decode(String.self, forKey: .reposUrl)
        self.eventsUrl = try container.decode(String.self, forKey: .eventsUrl)
        self.receivedEventsUrl = try container.decode(String.self, forKey: .receivedEventsUrl)
        self.type = try container.decode(String.self, forKey: .type)
        self.siteAdmin = try container.decodeIfPresent(Bool.self, forKey: .siteAdmin)
    }
}
