
//
//  ItemsTableViewDatasource.swift
//  SwiftTopStars
//
//  Created by Renan Trapp on 13/08/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import UIKit

protocol ItemsTableViewDatasource: UITableViewDataSource {
    associatedtype Element
    var items:[Element] {get}
    var delegate: UITableViewDelegate? {get}
    var tableView: UITableView? {get}
    
    init(items: [Element],
         tableView: UITableView,
         delegate: UITableViewDelegate,
         dataPrefetchDelegate: DataPrefetchDelegate,
         viewModel: TopRatedRepoTableViewCellViewModelProtocol)
    
    func setup()
}

extension ItemsTableViewDatasource {
    func setup() {
        self.tableView?.dataSource = self
        self.tableView?.delegate = self.delegate
        self.tableView?.reloadData()
    }
}
