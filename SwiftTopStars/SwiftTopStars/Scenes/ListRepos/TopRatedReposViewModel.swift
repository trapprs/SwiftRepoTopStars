//
//  TopRatedReposViewModel.swift
//  SwiftTopStars
//
//  Created by Renan Trapp on 13/08/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import Foundation

protocol TopRatedRepoNavigationProtocol: AnyObject {
    func goToDetails(of repo: Repository)
}

protocol TopRatedReposViewModelProtocol: AnyObject {
    var repos: Dynamic<[Repository]> { get }
    var error: Dynamic<String?> { get }
    
    func loadRepos()
}

final class TopRatedReposViewModel: TopRatedReposViewModelProtocol {
    var repos: Dynamic<[Repository]> = Dynamic([])
    var error: Dynamic<String?> = Dynamic(nil)
    private var navigationDelegate: TopRatedRepoNavigationProtocol?
    private var service: GitHubRepoServiceProtocol?
    private var numberOfPages: Int = 1
    
    init(service: GitHubRepoServiceProtocol? = nil,
         navigationDelegate: TopRatedRepoNavigationProtocol? = nil) {
        self.service = service
        self.navigationDelegate = navigationDelegate
    }
    
    func loadRepos() {
        service?.getTopStars(page: numberOfPages) { [weak self] result in
            guard let self = self else { return }
           
            switch result {
            case .success(let data):
                self.repos.value = data?.items ?? []
            case .failure(let failure):
                self.error.value = failure.localizedError
            }
        }
    }
}
