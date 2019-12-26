//
//  MoviesViewModelTest.swift
//  MovieDBTests
//
//  Created by Yris Siqueira on 26/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import XCTest
@testable import MovieDB

class MoviesViewModelTest: XCTestCase {
    
    
// MARK: - Attributes
    
    var viewModel: MoviesViewModel!
    var interactor: MoviesInteractorProtocol!

// MARK: - Initializers
    
    override func setUp() {
        interactor = MoviesInteractorMock()
        viewModel = MoviesViewModel(coordinator: nil, interactor: interactor)
        viewModel.delegate = self
    }
    
// MARK: - Deinitializers

    override func tearDown() {
        viewModel = nil
        interactor = nil
    }

// MARK: - Test View Model
    
    func testFetchMovies() {
        viewModel.fetchMovies()
    }

}

// MARK: - View Model Delegate

extension MoviesViewModelTest: MoviesViewModelDelegate {
    
    func fetchMovies(error: Error?) {
        if let err = error {
            XCTFail(err.localizedDescription)
        } else {
            XCTAssertNotNil(viewModel.movies)
            XCTAssert(viewModel.movies.count > 0)
        }
    }
    
}
