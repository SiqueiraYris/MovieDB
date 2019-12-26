//
//  ImageHelper.swift
//  MovieDB
//
//  Created by Yris Siqueira on 26/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import UIKit

// MARK: - Class Protocol

protocol ImageHelperProtocol: class {
    func getImage(url: URL, completion: @escaping (Data?) -> Void)
    func downloadImage(url: URL, completion: @escaping (UIImage) -> Void)
}

final class ImageHelper: API, ImageHelperProtocol {
    
    // MARK: - Attributes
    
    private var path: String = "https://image.tmdb.org/t/p/w500/"
    
    // MARK: - Get Image URL

    func getImage(url: URL, completion: @escaping (Data?) -> Void) {
        let imageURL: String = "\(path)\(url)"

        request(queryParams: nil, urlPath: imageURL) { result in
            switch result {
            case .success(let data):
                completion(data)
            case .failure:
                completion(nil)
            }
        }
    }
    
    // MARK: - Download Image
    
    func downloadImage(url: URL, completion: @escaping (UIImage) -> Void) {
        getImage(url: url) { data in
            guard let data = data else { return }
            DispatchQueue.main.async() {
                guard let image = UIImage(data: data) else { return }
                completion(image)
            }
        }
    }
    
}
