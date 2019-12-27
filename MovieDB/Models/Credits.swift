//
//  Credits.swift
//  MovieDB
//
//  Created by Yris Siqueira on 27/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import Foundation

class Credits: Codable {
    
    // MARK: - Attributes
    
    let cast: [Cast]?
    
    enum CodingKeys: String, CodingKey {
        case cast
    }
    
    // MARK: - Initializers

    init(cast: [Cast]?) {
        self.cast = cast
    }
    
}
