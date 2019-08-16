//
//  Repository.swift
//  SwiftTopStars
//
//  Created by Renan Trapp on 12/08/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import Foundation

struct Repository: Codable {
    var id: Int
    var nodeId: String
    var name: String
    var fullName: String
    var isPrivate: Bool
    var owner: Owner?
    var license: License?
    var htmlUrl: String
    var description: String?
    var fork: Bool?
    var url: String?
    var forksUrl: String
    var keysUrl: String
    var collaboratorsUrl: String
    var teamsUrl: String
    var hooksUrl: String
    var issueEventsUrl: String
    var eventsUrl: String
    var assigneesUrl: String
    var branchesUrl: String
    var tagsUrl: String
    var blobsUrl: String
    var gitTagsUrl: String
    var gitRefsUrl: String
    var treesUrl: String
    var statusesUrl: String
    var languagesUrl: String
    var stargazersUrl: String
    var contributorsUrl: String
    var subscribersUrl: String
    var subscriptionUrl: String
    var commitsUrl: String
    var gitCommitsUrl: String
    var commentsUrl: String
    var issueCommentUrl: String
    var contentsUrl: String
    var compareUrl: String
    var mergesUrl: String
    var archiveUrl: String
    var downloadsUrl: String
    var issuesUrl: String
    var pullsUrl: String
    var milestonesUrl: String
    var notificationsUrl: String
    var labelsUrl: String
    var releasesUrl: String
    var deploymentsUrl: String
    var createdAt: String
    var updatedAt: String
    var pushedAt: String
    var gitUrl: String
    var sshUrl: String
    var cloneUrl: String
    var svnUrl: String
    var homepage: String?
    var size: Int
    var stargazersCount: Int
    var watchersCount: Int
    var language: String
    var hasIssues: Bool
    var hasProjects: Bool
    var hasDownloads: Bool
    var hasWiki: Bool
    var hasPages: Bool
    var forksCount: Int
    var mirrorUrl: String?
    var archived: Bool
    var disabled: Bool
    var openIssuesCount: Int
    var forks: Int
    var openIssues: Int
    var watchers: Int
    var defaultBranch: String
    var score: Int
}

enum RepositoryKeys: String, CodingKey {
    case id = "id"
    case nodeId = "node_id"
    case name = "name"
    case fullName = "full_name"
    case isPrivate = "private"
    case owner = "owner"
    case license = "license"
    case htmlUrl = "html_url"
    case description = "description"
    case fork = "fork"
    case url = "url"
    case forksUrl = "forks_url"
    case keysUrl = "keys_url"
    case collaboratorsUrl = "collaborators_url"
    case teamsUrl = "teams_url"
    case hooksUrl = "hooks_url"
    case issueEventsUrl = "issue_events_url"
    case eventsUrl = "events_url"
    case assigneesUrl = "assignees_url"
    case branchesUrl = "branches_url"
    case tagsUrl = "tags_url"
    case blobsUrl = "blobs_url"
    case gitTagsUrl = "git_tags_url"
    case gitRefsUrl = "git_refs_url"
    case treesUrl = "trees_url"
    case statusesUrl = "statuses_url"
    case languagesUrl = "languages_url"
    case stargazersUrl = "stargazers_url"
    case contributorsUrl = "contributors_url"
    case subscribersUrl = "subscribers_url"
    case subscriptionUrl = "subscription_url"
    case commitsUrl = "commits_url"
    case gitCommitsUrl = "git_commits_url"
    case commentsUrl = "comments_url"
    case issueCommentUrl = "issue_comment_url"
    case contentsUrl = "contents_url"
    case compareUrl = "compare_url"
    case mergesUrl = "merges_url"
    case archiveUrl = "archive_url"
    case downloadsUrl = "downloads_url"
    case issuesUrl = "issues_url"
    case pullsUrl = "pulls_url"
    case milestonesUrl = "milestones_url"
    case notificationsUrl = "notifications_url"
    case labelsUrl = "labels_url"
    case releasesUrl = "releases_url"
    case deploymentsUrl = "deployments_url"
    case createdAt = "created_at"
    case updatedAt = "updated_at"
    case pushedAt = "pushed_at"
    case gitUrl = "git_url"
    case sshUrl = "ssh_url"
    case cloneUrl = "clone_url"
    case svnUrl = "svn_url"
    case homepage = "homepage"
    case size = "size"
    case stargazersCount = "stargazers_count"
    case watchersCount = "watchers_count"
    case language = "language"
    case hasIssues = "has_issues"
    case hasProjects = "has_projects"
    case hasDownloads = "has_downloads"
    case hasWiki = "has_wiki"
    case hasPages = "has_pages"
    case forksCount = "forks_count"
    case mirrorUrl = "mirror_url"
    case archived = "archived"
    case disabled = "disabled"
    case openIssuesCount = "open_issues_count"
    case forks = "forks"
    case openIssues = "open_issues"
    case watchers = "watchers"
    case defaultBranch = "default_branch"
    case score = "score"
}

extension Repository {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RepositoryKeys.self)
        self.id = try  container.decode(Int.self, forKey: .id)
        self.nodeId = try container.decode(String.self, forKey: .nodeId)
        self.name = try  container.decode(String.self, forKey: .name)
        self.fullName = try  container.decode(String.self, forKey: .fullName)
        self.isPrivate = try  container.decode(Bool.self, forKey: .isPrivate)
        self.owner = try  container.decodeIfPresent(Owner.self, forKey: .owner)
        self.license = try  container.decodeIfPresent(License.self, forKey: .license)
        self.htmlUrl = try  container.decode(String.self, forKey: .htmlUrl)
        self.description = try  container.decode(String.self, forKey: .description)
        self.fork = try  container.decodeIfPresent(Bool.self, forKey: .fork)
        self.url = try  container.decode(String.self, forKey: .url)
        self.forksUrl = try  container.decode(String.self, forKey: .forksUrl)
        self.keysUrl = try  container.decode(String.self, forKey: .keysUrl)
        self.collaboratorsUrl = try  container.decode(String.self, forKey: .collaboratorsUrl)
        self.teamsUrl = try  container.decode(String.self, forKey: .teamsUrl)
        self.hooksUrl = try  container.decode(String.self, forKey: .hooksUrl)
        self.issueEventsUrl = try  container.decode(String.self, forKey: .issueEventsUrl)
        self.eventsUrl = try  container.decode(String.self, forKey: .eventsUrl)
        self.assigneesUrl = try  container.decode(String.self, forKey: .assigneesUrl)
        self.branchesUrl = try  container.decode(String.self, forKey: .branchesUrl)
        self.tagsUrl = try  container.decode(String.self, forKey: .tagsUrl)
        self.blobsUrl = try  container.decode(String.self, forKey: .blobsUrl)
        self.gitTagsUrl = try  container.decode(String.self, forKey: .gitTagsUrl)
        self.gitRefsUrl = try  container.decode(String.self, forKey: .gitRefsUrl)
        self.treesUrl = try  container.decode(String.self, forKey: .treesUrl)
        self.statusesUrl = try  container.decode(String.self, forKey: .statusesUrl)
        self.languagesUrl = try  container.decode(String.self, forKey: .languagesUrl)
        self.stargazersUrl = try  container.decode(String.self, forKey: .stargazersUrl)
        self.contributorsUrl = try  container.decode(String.self, forKey: .contributorsUrl)
        self.subscribersUrl = try  container.decode(String.self, forKey: .subscribersUrl)
        self.subscriptionUrl = try  container.decode(String.self, forKey: .subscriptionUrl)
        self.commitsUrl = try  container.decode(String.self, forKey: .commitsUrl)
        self.gitCommitsUrl = try  container.decode(String.self, forKey: .gitCommitsUrl)
        self.commentsUrl = try  container.decode(String.self, forKey: .commentsUrl)
        self.issueCommentUrl = try  container.decode(String.self, forKey: .issueCommentUrl)
        self.contentsUrl = try  container.decode(String.self, forKey: .contentsUrl)
        self.compareUrl = try  container.decode(String.self, forKey: .compareUrl)
        self.mergesUrl = try  container.decode(String.self, forKey: .mergesUrl)
        self.archiveUrl = try  container.decode(String.self, forKey: .archiveUrl)
        self.downloadsUrl = try  container.decode(String.self, forKey: .downloadsUrl)
        self.issuesUrl = try  container.decode(String.self, forKey: .issuesUrl)
        self.pullsUrl = try  container.decode(String.self, forKey: .pullsUrl)
        self.milestonesUrl = try  container.decode(String.self, forKey: .milestonesUrl)
        self.notificationsUrl = try  container.decode(String.self, forKey: .notificationsUrl)
        self.labelsUrl = try  container.decode(String.self, forKey: .labelsUrl)
        self.releasesUrl = try  container.decode(String.self, forKey: .releasesUrl)
        self.deploymentsUrl = try  container.decode(String.self, forKey: .deploymentsUrl)
        self.createdAt = try  container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try  container.decode(String.self, forKey: .updatedAt)
        self.pushedAt = try  container.decode(String.self, forKey: .pushedAt)
        self.gitUrl = try  container.decode(String.self, forKey: .gitUrl)
        self.sshUrl = try  container.decode(String.self, forKey: .sshUrl)
        self.cloneUrl = try  container.decode(String.self, forKey: .cloneUrl)
        self.svnUrl = try  container.decode(String.self, forKey: .svnUrl)
        self.homepage = try  container.decodeIfPresent(String.self, forKey: .homepage)
        self.size = try  container.decode(Int.self, forKey: .size)
        self.stargazersCount = try  container.decode(Int.self, forKey: .stargazersCount)
        self.watchersCount = try  container.decode(Int.self, forKey: .watchersCount)
        self.language = try  container.decode(String.self, forKey: .language)
        self.hasIssues = try  container.decode(Bool.self, forKey: .hasIssues)
        self.hasProjects = try  container.decode(Bool.self, forKey: .hasProjects)
        self.hasDownloads = try  container.decode(Bool.self, forKey: .hasDownloads)
        self.hasWiki = try  container.decode(Bool.self, forKey: .hasWiki)
        self.hasPages = try  container.decode(Bool.self, forKey: .hasPages)
        self.forksCount = try  container.decode(Int.self, forKey: .forksCount)
        self.mirrorUrl = try  container.decodeIfPresent(String.self, forKey: .mirrorUrl)
        self.archived = try  container.decode(Bool.self, forKey: .archived)
        self.disabled = try  container.decode(Bool.self, forKey: .disabled)
        self.openIssuesCount = try  container.decode(Int.self, forKey: .openIssuesCount)
        self.forks = try  container.decode(Int.self, forKey: .forks)
        self.openIssues = try  container.decode(Int.self, forKey: .openIssues)
        self.watchers = try  container.decode(Int.self, forKey: .watchers)
        self.defaultBranch = try  container.decode(String.self, forKey: .defaultBranch)
        self.score = try  container.decode(Int.self, forKey: .score)
    }
}
