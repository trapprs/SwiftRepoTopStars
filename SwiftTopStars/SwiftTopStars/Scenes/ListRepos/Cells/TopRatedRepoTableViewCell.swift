//
//  TopRatedRepoTableViewCell.swift
//  SwiftTopStars
//
//  Created by Renan Trapp on 13/08/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import UIKit

class TopRatedRepoTableViewCell: UITableViewCell {

    @IBOutlet private weak var background: UIView!
    @IBOutlet private weak var repositoryNameLabel: UILabel!
    @IBOutlet private weak var starsLabel: UILabel!
    @IBOutlet private weak var authorLabel: UILabel!
    @IBOutlet private weak var authorImageView: UIImageView! {
        didSet {
            let view = UIView(frame: .zero)
            view.layer.shadowPath = UIBezierPath(rect: view.bounds).cgPath
            view.layer.shadowRadius = 10
            view.layer.shadowOffset = .zero
            view.layer.shadowOpacity = 1
            view.center = authorImageView.center
            authorImageView.addSubview(view)
            authorImageView.layer.cornerRadius = 35
        }
    }
    
    func setup(repository: Repository) {
        repositoryNameLabel.text = repository.name.uppercased()
        authorLabel.text = "\(repository.owner?.login.uppercased() ?? "")"
        starsLabel.text = "\(repository.watchersCount)"
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
