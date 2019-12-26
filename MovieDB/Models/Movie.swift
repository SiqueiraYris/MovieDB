//
//  Movie.swift
//  MovieDB
//
//  Created by Yris Siqueira da Silva on 20/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

// MARK: - Movie

class Movie: Codable {
    
    // MARK: - Attributes
    
    let id: Int
    let genreIds: [Int]
    let popularity: Double
    let video: Bool
    let voteCount: Int
    let voteAverage: Double
    let title: String
    let releaseDate: String
    let originalLanguage: String
    let originalTitle: String
    let backdropPath: String?
    let adult: Bool
    let overview: String
    let posterPath: String

    enum CodingKeys: String, CodingKey {
        case popularity, id, video, title, adult, overview
        case genreIds = "genre_ids"
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case releaseDate = "release_date"
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
    }
    
    // MARK: - Initializers

    init(id: Int, popularity: Double, genreIds: [Int], title: String, video: Bool, voteCount: Int, voteAverage: Double, releaseDate: String, originalLanguage: String, originalTitle: String, backdropPath: String, adult: Bool, overview: String, posterPath: String) {
        self.popularity = popularity
        self.id = id
        self.video = video
        self.voteCount = voteCount
        self.voteAverage = voteAverage
        self.title = title
        self.releaseDate = releaseDate
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.genreIds = genreIds
        self.backdropPath = backdropPath
        self.adult = adult
        self.overview = overview
        self.posterPath = posterPath
    }
    
}
