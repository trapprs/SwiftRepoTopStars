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
    var isLoading: Dynamic<Bool> { get }
    
    func loadRepos()
    func loadNextRepos()
    func restartRepos()
}

final class TopRatedReposViewModel: TopRatedReposViewModelProtocol {
    var repos: Dynamic<[Repository]> = Dynamic([])
    var error: Dynamic<String?> = Dynamic(nil)
    var isLoading: Dynamic<Bool> = Dynamic(true)
    
    private var navigationDelegate: TopRatedRepoNavigationProtocol?
    private var service: GitHubRepoServiceProtocol?
    private var numberOfPages: Int = 1
    
    // MARK: - Initialization
    init(service: GitHubRepoServiceProtocol? = nil,
         navigationDelegate: TopRatedRepoNavigationProtocol? = nil) {
        self.service = service
        self.navigationDelegate = navigationDelegate
    }
    
    // MARK: - Functions
    func loadRepos() {
        self.service?.getTopStars(page: self.numberOfPages) { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    if self.numberOfPages == 1 {
                        self.isLoading.value = false
                        self.repos.value = data?.items ?? []
                    } else {
                        self.repos.value.append(contentsOf: data?.items ?? [])
                    }
                    self.numberOfPages += 1
                case .failure(let failure):
                    self.error.value = failure.localizedError
                }
            }
        }
    }
    
    func loadNextRepos() {
        loadRepos()
    }
    
    func restartRepos() {
        self.numberOfPages = 1
        
        loadRepos()
    }
}
