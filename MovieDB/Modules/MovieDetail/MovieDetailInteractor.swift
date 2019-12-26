//
//  MovieDetailInteractor.swift
//  MovieDB
//
//  Created by Yris Siqueira on 26/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import Foundation

// MARK: - Interactor Protocol

protocol MovieDetailInteractorProtocol: class {
    func fetchMovieDetailById(id: Int, completion: @escaping (Result<MovieDetail, Error>) -> Void)
    func fetchMovieImages(id: Int, completion: @escaping (Result<[Backdrop], Error>) -> Void)
}

final class MovieDetailInteractor: API, MovieDetailInteractorProtocol {
    
    // MARK: - Attributes
    
    private var serviceKey: String = "16fd5a2a34d2c3651edf338a920f6176"
    private var path: String = "https://api.themoviedb.org/3"
    
    // MARK: - Fetch Data
    
    func fetchMovieDetailById(id: Int, completion: @escaping (Result<MovieDetail, Error>) -> Void) {
        let params = [
           "api_key": serviceKey
        ]

        request(queryParams: params, urlPath: "\(path)/movie/\(id)") { response in
            switch response {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(MovieDetail.self, from: data)
                    completion(.success(response))
                } catch let error {
                    completion(.failure(error))
                }
            }
        }
    }
    
    func fetchMovieImages(id: Int, completion: @escaping (Result<[Backdrop], Error>) -> Void) {
        let params = [
           "api_key": serviceKey
        ]

        request(queryParams: params, urlPath: "\(path)/movie/\(id)/images") { response in
            switch response {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(MovieImage.self, from: data)
                    completion(.success(response.backdrops ?? []))
                } catch let error {
                    completion(.failure(error))
                }
            }
        }
    }
    
}
