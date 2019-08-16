//
//  TopRatedRepoTableViewCell.swift
//  SwiftTopStars
//
//  Created by Renan Trapp on 13/08/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import UIKit

class TopRatedRepoTableViewCell: UITableViewCell {
    @IBOutlet private weak var imageActivityIndicator: UIActivityIndicatorView! {
        didSet {
            imageActivityIndicator.hidesWhenStopped = true
        }
    }
    @IBOutlet private weak var backgroundImageView: UIView! {
        didSet {
            backgroundImageView.layer.cornerRadius = 35
            backgroundImageView.layer.shadowPath = UIBezierPath(rect: backgroundImageView.bounds).cgPath
            backgroundImageView.layer.shadowRadius = 10
            backgroundImageView.layer.shadowOffset = .zero
            backgroundImageView.layer.shadowOpacity = 0.1
        }
    }
    @IBOutlet private weak var positionLabel: UILabel!
    @IBOutlet private weak var repositoryNameLabel: UILabel!
    @IBOutlet private weak var starsLabel: UILabel!
    @IBOutlet private weak var authorLabel: UILabel!
    @IBOutlet private weak var authorImageView: UIImageView! {
        didSet {
            authorImageView.layer.cornerRadius = 35
        }
    }
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - Functions
    func setup(viewModel: TopRatedRepoTableViewCellViewModelProtocol, position: Int) {
        guard let repository = viewModel.repository else { return }
        
        self.authorImageView.image = UIImage()
        imageActivityIndicator.startAnimating()
        repositoryNameLabel.text = repository.name.uppercased()
        authorLabel.text = "\(repository.owner?.login.uppercased() ?? "")"
        starsLabel.text = "\(repository.watchersCount)"
        positionLabel.text = "#\(position)"
        
        viewModel.getImage(from: repository.owner?.avatarUrl) { [weak self] image in
            guard let self = self else { return }
           
            DispatchQueue.main.async {
                self.imageActivityIndicator.stopAnimating()
                self.authorImageView.image = image
            }
        }
    }
}
