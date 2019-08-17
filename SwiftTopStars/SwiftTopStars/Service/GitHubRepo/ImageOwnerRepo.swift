//
//  ImageOwnerRepo.swift
//  SwiftTopStars
//
//  Created by Renan Trapp on 16/08/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import UIKit

class ImageOwnerRepo {

    func requestImage(_ url: String, completion: @escaping (GenericResult<UIImage>) -> Void)  {
        guard let URL = URL(string: url) else {
            completion(.failure(APIError.requestFailed))
            return
        }
        DispatchQueue.global(qos: .userInteractive).async {
        
            let task = URLSession.shared.dataTask(with: URL) { url, _, error in
                if let error = error {
                    completion(.failure(error))
                }
                guard let data = url else { return }

                if let image = UIImage(data: data) {
                    completion(.success(image))
                }
                else {
                    completion(.failure(APIError.requestFailed))
                }
            }
        
            task.resume()
        }
        
    }
}
