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
    @IBOutlet weak var movieOverview: UITextView!
    @IBOutlet weak var movieReleaseDate: UILabel!
    @IBOutlet weak var movieContentView: UIView!
    @IBOutlet weak var movieRatingView: UIView!
    @IBOutlet weak var movieRating: UILabel!
    
    // MARK: - Initializers
    
    func configure(with viewModel: MoviesCellViewModel) {
        movieTitle.text = viewModel.movieTitle
        movieOverview.text = viewModel.movieOverview
        movieReleaseDate.text = viewModel.movieRelease
        movieRating.text = viewModel.movieRating
        
        movieImage.download(image: viewModel.movieImage)
        movieImage.addRoundedBorder(radious: 5.0, color: UIColor.caribbeanGreen.cgColor)
        
        movieContentView.roundCorners(radious: 5.0)
        movieRatingView.roundCorners(radious: 5.0)
        
        self.selectionStyle = .none
    }
    
}
