//
//  TopRatedRepoTableViewCellViewModel.swift
//  SwiftTopStars
//
//  Created by Renan Trapp on 15/08/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import UIKit

protocol TopRatedRepoTableViewCellViewModelProtocol: Any {
    var repository: Repository? { get }
    
    func getImage(from url: String?, completion: @escaping(UIImage) -> Void)
}

final class TopRatedRepoTableViewCellViewModel: TopRatedRepoTableViewCellViewModelProtocol {
    var repository: Repository?
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func getImage(from url: String?, completion: @escaping (UIImage) -> Void) {
        ImageOwnerRepo().requestImage(url ?? "") { image in
            
            switch image {
            case .success(let image):
                completion(image)
            case .failure:
                break
            }
        }
    }
}
