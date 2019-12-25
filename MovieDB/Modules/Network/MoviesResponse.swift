//
//  MoviesResponse.swift
//  MovieDB
//
//  Created by Yris Siqueira on 24/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import Foundation

class MoviesResponse: Codable {
    
    // MARK: - Attributes
    
    let page, totalResults, totalPages: Int
    let results: [Movie]

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
    
    // MARK: - Life Cycle

    init(results: [Movie], page: Int, totalResults: Int, totalPages: Int) {
        self.results = results
        self.totalResults = totalResults
        self.totalPages = totalPages
        self.page = page
    }
    
}
