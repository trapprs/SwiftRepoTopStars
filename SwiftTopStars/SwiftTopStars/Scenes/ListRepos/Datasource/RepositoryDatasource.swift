//
//  RepositoryDatasource.swift
//  SwiftTopStars
//
//  Created by Renan Trapp on 13/08/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import UIKit

protocol DataPrefetchDelegate: Any {
    func loadNextPage()
}

enum DirectionYTableView {
    case up
    case down
    case idle
}

final class RepositoryDatasource: NSObject, ItemsTableViewDatasource {
    var items:[Repository] = []
    var delegate: UITableViewDelegate?
    var tableView: UITableView?
    var dataPrefetchDelegate: DataPrefetchDelegate?
    private var viewModel: TopRatedRepoTableViewCellViewModelProtocol?
    
    private var spinner: UIActivityIndicatorView?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TopRatedRepoTableViewCell.reuseID, for: indexPath) as? TopRatedRepoTableViewCell else { return UITableViewCell() }
        let repository = self.items[indexPath.row]
        let positionRepository = indexPath.row + 1
        let viewModel = TopRatedRepoTableViewCellViewModel(repository: repository)
        cell.setup(viewModel: viewModel, position: positionRepository)
       
        spinner?.startAnimating()
        if let lastVisibleIndexPath = tableView.indexPathsForVisibleRows?.last {
            if indexPath == lastVisibleIndexPath {
                spinner?.stopAnimating()
            }
        }

        return cell
    }
    
    init(items: [Repository],
         tableView: UITableView,
         delegate: UITableViewDelegate,
         dataPrefetchDelegate: DataPrefetchDelegate,
         viewModel: TopRatedRepoTableViewCellViewModelProtocol) {
        self.items = items
        self.tableView = tableView
        self.delegate = delegate
        self.viewModel = viewModel
        super.init()
        
        let nib = UINib.init(nibName: TopRatedRepoTableViewCell.reuseID,
                             bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: TopRatedRepoTableViewCell.reuseID)
        self.dataPrefetchDelegate = dataPrefetchDelegate
        tableView.prefetchDataSource = self
        self.spinner = setSpinner(tableView: tableView)
        
        self.setup()
    }
    
    private func setSpinner(tableView: UITableView) -> UIActivityIndicatorView {
        let spinner = UIActivityIndicatorView(style: .gray)
        spinner.color = UIColor.darkGray
        spinner.hidesWhenStopped = true
        tableView.tableFooterView = spinner
        
        return spinner
    }
}

// MARK: - UITableViewDataSourcePrefetching
extension RepositoryDatasource: UITableViewDataSourcePrefetching {
    func isLoadingCell(for indexPath: IndexPath) -> Bool {
        return indexPath.row >= items.count - 1
    }
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        if indexPaths.contains(where: isLoadingCell) {
            dataPrefetchDelegate?.loadNextPage()
        }
    }
}
