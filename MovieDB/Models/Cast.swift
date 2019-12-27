//
//  Cast.swift
//  MovieDB
//
//  Created by Yris Siqueira on 27/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import Foundation

class Cast: Codable {
    
    // MARK: - Attributes
    
    let character: String?
    let name: String?
    let profilePath: String?

    enum CodingKeys: String, CodingKey {
        case character
        case name
        case profilePath = "profile_path"
    }
    
    // MARK: - Initializers

    init(character: String?, name: String?, profilePath: String?) {
        self.character = character
        self.name = name
        self.profilePath = profilePath
    }
    
}
