//
//  MovieDetailInteractorMock.swift
//  MovieDBTests
//
//  Created by Yris Siqueira on 26/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import Foundation
@testable import MovieDB

final class MovieDetailInteractorMock: MovieDetailInteractorProtocol {
    
    // MARK: - Fetch Data From Mock File
    
    func fetchMovieDetailById(id: Int, completion: @escaping (Result<MovieDetail, Error>) -> Void) {
        guard let path = Bundle.main.path(forResource: "movie", ofType: "json") else {
            completion(.failure(TestErrors.fileNotFound))
            return
        }
        
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) else {
            completion(.failure(TestErrors.cantCreateData))
            return
        }
        
        if let response = try? JSONDecoder.init().decode(MovieDetail.self, from: data) {
            completion(.success(response))
        } else {
            completion(.failure(TestErrors.decodeData))
        }
    }
    
    func fetchMovieImages(id: Int, completion: @escaping (Result<[Backdrop], Error>) -> Void) {
        guard let path = Bundle.main.path(forResource: "backdrops", ofType: "json") else {
            completion(.failure(TestErrors.fileNotFound))
            return
        }
        
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) else {
            completion(.failure(TestErrors.cantCreateData))
            return
        }
        
        if let response = try? JSONDecoder.init().decode(MovieImage.self, from: data) {
            completion(.success(response.backdrops ?? []))
        } else {
            completion(.failure(TestErrors.decodeData))
        }
    }
     
}
