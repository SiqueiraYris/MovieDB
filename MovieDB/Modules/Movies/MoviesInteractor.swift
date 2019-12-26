//
//  MoviesInteractor.swift
//  MovieDB
//
//  Created by Yris Siqueira da Silva on 20/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import Foundation

// MARK: - Interactor Protocol

protocol MoviesInteractorProtocol: class {
    func fetchMoviesFromPage(completion: @escaping (Result<[Movie], Error>) -> Void)
}

final class MoviesInteractor: API, MoviesInteractorProtocol {
    
    // MARK: - Attributes
    
    private var serviceKey: String = "16fd5a2a34d2c3651edf338a920f6176"
    private var path: String = "https://api.themoviedb.org/3"
    
    // MARK: - Fetch Data
    
    func fetchMoviesFromPage(completion: @escaping (Result<[Movie], Error>) -> Void) {
        let params = [
           "api_key": serviceKey
        ]

        request(queryParams: params, urlPath: "\(path)/movie/top_rated") { response in
            switch response {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(MoviesResponse.self, from: data)
                    completion(.success(response.results))
                } catch let error {
                    completion(.failure(error))
                }
            }
        }
    }
    
}
