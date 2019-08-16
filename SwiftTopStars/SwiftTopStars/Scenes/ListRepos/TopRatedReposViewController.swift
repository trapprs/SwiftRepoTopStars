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
            tableView.addSubview(refreshControl)
        }
    }
    @IBOutlet private weak var topLeftConstraint: NSLayoutConstraint!
    
    @IBOutlet private var tableViewSideConstraint: [NSLayoutConstraint]!
    @IBOutlet private weak var titleTopConstraint: NSLayoutConstraint!
    @IBOutlet private weak var backgroundTopHeightConstraint: NSLayoutConstraint!
    private var initialTitleTopConstraint: CGFloat = 0
    private var initialBackgroundTopConstraint: CGFloat = 0
    private var initialTableViewSideConstraint: CGFloat = 0
    private var viewModel: TopRatedReposViewModelProtocol
    private var tableDatasource: RepositoryDatasource?
    private var tableDelegate: RepositoryTableDelegate?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialTitleTopConstraint = self.titleTopConstraint.constant
        initialBackgroundTopConstraint = backgroundTopHeightConstraint.constant
        initialTableViewSideConstraint = tableViewSideConstraint.first?.constant ?? 0
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
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshControlData), for: .valueChanged)
        return refreshControl
    }()
    
    func setupTableView(with repositories: [Repository]) {
        tableDelegate = RepositoryTableDelegate(self)
        tableDatasource = RepositoryDatasource(items: repositories,
                                               tableView: self.tableView,
                                               delegate: tableDelegate!,
                                               dataPrefetchDelegate: self)
    }
    
    @objc private func refreshControlData() {
        if refreshControl.isRefreshing {
            viewModel.restartRepos()
        }
        
        self.refreshControl.endRefreshing()
    }
}

extension TopRatedReposViewController: RepositorysDelegate {
    func didStartToSwipe(direction: DirectionYTableView) {
        UIView.animate(withDuration: 0.3) {
            if direction == .up {
                if self.titleTopConstraint.constant > 25 {
                    self.titleTopConstraint.constant = 25
                    self.backgroundTopHeightConstraint.constant = 56
                    self.tableViewSideConstraint.forEach({ constraint in
                        constraint.constant = 0
                    })
                }
            } else if direction == .down {
                self.titleTopConstraint.constant = self.initialTitleTopConstraint
                self.backgroundTopHeightConstraint.constant = self.initialBackgroundTopConstraint
                self.tableViewSideConstraint.forEach({ constraint in
                    self.topLeftConstraint.constant = 0
                    constraint.constant = self.initialTableViewSideConstraint
                })
            }
            self.view.layoutIfNeeded()
        }
    }
    
    func didSelectCharacter(at index: IndexPath) {
        // TODO
    }
}

// MARK: - DataPrefetchDelegate
extension TopRatedReposViewController: DataPrefetchDelegate {
    func loadNextPage() {
        viewModel.loadNextRepos()
        
    }
}
