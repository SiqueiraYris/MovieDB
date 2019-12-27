//
//  CastCollectionViewCell.swift
//  MovieDB
//
//  Created by Yris Siqueira on 26/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import UIKit

class CastCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Attributes
    
    static let identifier = "CastCollectionViewCell"
    
    // MARK: - Outlets
    
    @IBOutlet weak var actorImage: UIImageView!
    @IBOutlet weak var actorName: UILabel!
    @IBOutlet weak var character: UILabel!
    
    // MARK: - Initializers
    
    func configure(with viewModel: CastCellViewModel) {
        actorName.text = viewModel.actorName
        character.text = viewModel.character
        
        if let image = viewModel.profilePath {
            actorImage.download(image: image)
            actorImage.roundImage()
        }
    }

}
