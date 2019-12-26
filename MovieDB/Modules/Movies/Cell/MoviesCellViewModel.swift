//
//  MoviesCellViewModel.swift
//  MovieDB
//
//  Created by Yris Siqueira on 25/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import Foundation

class MoviesCellViewModel {
    
    // MARK: - Attributes
    
    let movieImage: String!
    let movieRelease: String!
    let movieTitle: String!
    let movieOverview: String!
    let movieRating: String!

    // MARK: - Initializers
    
    init(with movie: Movie) {
        movieImage = movie.posterPath
        movieTitle = movie.title
        movieOverview = movie.overview
        movieRating = movie.voteAverage.description
        movieRelease = movie.releaseDate.prefix(4).description
    }

}
