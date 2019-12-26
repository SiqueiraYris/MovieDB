//
//  MovieDetail.swift
//  MovieDB
//
//  Created by Yris Siqueira on 26/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import Foundation

class MovieDetail: Codable {
    
    // MARK: - Attributes
    
    let id: Int
    let title: String
    let adult: Bool 
    let backdropPath: String
    let imdbID: String
    let overview: String
    let posterPath: String
    let releaseDate: String
    let runtime: Int
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case id
        case adult
        case runtime
        case title
        case overview
        case backdropPath = "backdrop_path"
        case imdbID = "imdb_id"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    // MARK: - Initializers

    init(id: Int, adult: Bool, backdropPath: String, imdbID: String, overview: String, posterPath: String, releaseDate: String, runtime: Int, title: String, voteAverage: Double, voteCount: Int) {
        self.adult = adult
        self.backdropPath = backdropPath
        self.id = id
        self.imdbID = imdbID
        self.overview = overview
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.runtime = runtime
        self.title = title
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
    
}
