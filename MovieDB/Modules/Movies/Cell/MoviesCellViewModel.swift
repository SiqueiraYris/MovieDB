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
//    let movieRating: String!
//    let movieRatingValue: Double!

    // MARK: - Initializers
    
    init(with movie: Movie) {
        movieImage = movie.posterPath
        movieTitle = movie.title
        movieOverview = movie.overview
        movieRelease = movie.releaseDate.prefix(4).description
//        movieRating = movie.voteAverage.description
//        movieRatingValue = movie.voteAverage
    }

}
