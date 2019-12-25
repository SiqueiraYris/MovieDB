//
//  MoviesCellViewModel.swift
//  MovieDB
//
//  Created by Yris Siqueira on 25/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import Foundation

class MoviesCellViewModel {

    let movieImage: String!
    let movieRelease: String!
    let movieTitle: String!
    let movieOverview: String!

    init(with movie: Movie) {
        movieImage = movie.posterPath
        movieTitle = movie.title
        movieOverview = movie.overview
        movieRelease = movie.releaseDate.prefix(4).description
    }

}
