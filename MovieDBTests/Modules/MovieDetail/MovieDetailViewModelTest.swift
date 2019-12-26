//
//  MovieDetailViewModelTest.swift
//  MovieDBTests
//
//  Created by Yris Siqueira on 26/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import XCTest
@testable import MovieDB

class MovieDetailViewModelTest: XCTestCase {
    
    // MARK: - Attributes
    
    var viewModel: MovieDetailViewModel!
    var interactor: MovieDetailInteractorProtocol!

    // MARK: - Initializers
    
    override func setUp() {
        interactor = MovieDetailInteractorMock()
        viewModel = MovieDetailViewModel(coordinator: nil, interactor: interactor, movieId: 19404)
        viewModel.delegate = self
    }
    
    // MARK: - Deinitializers
    
    override func tearDown() {
        viewModel = nil
        interactor = nil
    }

    // MARK: - Test View Model
    
    func testFetchMovieDetail() {
        viewModel.fetchMovieDetail()
    }

}

// MARK: - View Model Delegate

extension MovieDetailViewModelTest: MovieDetailViewModelDelegate {
    
    func fetchMovieDetail(error: Error?) {
        if let err = error {
            XCTFail(err.localizedDescription)
        } else {
            XCTAssertNotNil(viewModel.movie)
        }
    }

}
