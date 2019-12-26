//
//  Backdrop.swift
//  MovieDB
//
//  Created by Yris Siqueira on 26/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import Foundation

class Backdrop: Codable {
    
    // MARK: - Attributes
    
    let aspectRatio: Double?
    let filePath: String?
    let height: Int?
    let width: Int?

    enum CodingKeys: String, CodingKey {
        case height
        case width
        case aspectRatio = "aspect_ratio"
        case filePath = "file_path"
    }
    
    // MARK: - Initializers

    init(aspectRatio: Double?, filePath: String?, height: Int?, width: Int?) {
        self.aspectRatio = aspectRatio
        self.filePath = filePath
        self.height = height
        self.width = width
    }
    
}
