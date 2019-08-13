//
//  TopRatedReposViewController.swift
//  SwiftTopStars
//
//  Created by Renan Trapp on 07/08/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import UIKit

final class TopRatedReposViewController: UIViewController {
    private var viewModel: TopRatedReposViewModelProtocol
    
    init(viewModel: TopRatedReposViewModelProtocol) {
        self.viewModel = viewModel
        
        super.init(nibName: "TopRatedReposViewController", bundle: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindValues()
    }
    private func bindValues() {
//        viewModel.repos.bindAndFire { [weak self] repository in
//            //guard let self = self else { return }
//
//
//        }
//        viewModel.error.bind { [weak self] message in
//            //guard
//              //  let self = self,
//               // let message = message
//               // else { return }
//
//            // Set alert
//        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
