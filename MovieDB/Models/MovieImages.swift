//
//  MovieImages.swift
//  MovieDB
//
//  Created by Yris Siqueira on 26/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import Foundation

class MovieImage: Codable {
    
    // MARK: - Attributes
    
    let id: Int?
    let backdrops: [Backdrop]?
    
    // MARK: - Initializers

    init(id: Int?, backdrops: [Backdrop]?) {
        self.id = id
        self.backdrops = backdrops
    }
    
}
