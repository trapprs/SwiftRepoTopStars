//
//  TopRatedReposViewController.swift
//  SwiftTopStars
//
//  Created by Renan Trapp on 07/08/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import UIKit

final class TopRatedReposViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var titleTopConstraint: NSLayoutConstraint!
    private var viewModel: TopRatedReposViewModelProtocol
    private var tableDatasource: RepositoryDatasource?
    private var tableDelegate: RepositoryTableDelegate?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        bindValues()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.loadRepos()
    }
    // MARK: - Initialization
    init(viewModel: TopRatedReposViewModelProtocol) {
        self.viewModel = viewModel
        
        super.init(nibName: "TopRatedReposViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    private func bindValues() {
        viewModel.repos.bindAndFire { [weak self] repository in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.setupTableView(with: repository)
            }
        }
        viewModel.error.bind {  message in
        }
    }
    
    func setupTableView(with repositories: [Repository]) {
        tableDelegate = RepositoryTableDelegate(self)
        tableDatasource = RepositoryDatasource(items: repositories,
                                               tableView: self.tableView,
                                               delegate: tableDelegate!,
                                               dataPrefetchDelegate: self)
    }
}

extension TopRatedReposViewController: RepositorysDelegate {
    func didStartToSwipe(_ yPosition: CGFloat, direction: DirectionYTableView) {
        if yPosition > 0 {
            if direction == .up, titleTopConstraint.constant >= 65 {
                titleTopConstraint.constant -= 5
            } else if direction == .down, titleTopConstraint.constant < 115 {
                titleTopConstraint.constant += 5
            }
        }
        
    }
    
    func didSelectCharacter(at index: IndexPath) {
            
    }
}

// MARK: - DataPrefetchDelegate
extension TopRatedReposViewController: DataPrefetchDelegate {
    func loadNextPage() {
        viewModel.loadNextRepos()
    }
}
