//
//  MoviesTableViewCell.swift
//  MovieDB
//
//  Created by Yris Siqueira on 25/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {
    
    // MARK: - Attributes
    
    static let identifier = "MoviesTableViewCell"
    
    // MARK: - Outlets

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieOverview: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    
    // MARK: - Initializers
    
    func configure(with viewModel: MoviesCellViewModel) {
        movieTitle.text = viewModel.movieTitle
        movieOverview.text = viewModel.movieOverview
        movieReleaseDate.text = viewModel.movieRelease
    }
    
}
