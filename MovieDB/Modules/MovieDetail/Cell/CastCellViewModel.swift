//
//  CastCellViewModel.swift
//  MovieDB
//
//  Created by Yris Siqueira on 27/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import Foundation

final class CastCellViewModel {
    
    // MARK: - Attributes
    
    let actorName: String!
    let character: String?
    let profilePath: String?

    // MARK: - Initializers
    
    init(with cast: Cast) {
        actorName = cast.name
        character = cast.character
        profilePath = cast.profilePath
    }

}
