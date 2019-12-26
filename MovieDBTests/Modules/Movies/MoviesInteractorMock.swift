//
//  MoviesInteractorMock.swift
//  MovieDBTests
//
//  Created by Yris Siqueira on 26/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import Foundation
@testable import MovieDB

// MARK: - Custom Errors

enum TestErrors: Error {
    case fileNotFound
    case cantCreateData
    case decodeData
}

final class MoviesInteractorMock: MoviesInteractorProtocol {
    
    // MARK: - Fetch Data From Mock File
    
    func fetchMoviesFromPage(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let path = Bundle.main.path(forResource: "movies", ofType: "json") else {
            completion(.failure(TestErrors.fileNotFound))
            return
        }
        
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) else {
            completion(.failure(TestErrors.cantCreateData))
            return
        }
        
        if let response = try? JSONDecoder.init().decode(MoviesResponse.self, from: data) {
            completion(.success(response.results))
        } else {
            completion(.failure(TestErrors.decodeData))
        }
    }
    
}
