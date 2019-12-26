//
//  MoviesViewModel.swift
//  MovieDB
//
//  Created by Yris Siqueira da Silva on 19/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import Foundation

// MARK: - View Model Protocol

protocol MoviesViewModelProtocol {
    var movies: [Movie] { get }
    var delegate: MoviesViewModelDelegate? { get set }

    func presentMovieDetail(at row: Int)
    func fetchMovies()
}

// MARK: - View Model Delegate

protocol MoviesViewModelDelegate {
    func fetchMovies(error: Error?)
}

final class MoviesViewModel: MoviesViewModelProtocol {
    
    // MARK: - Attributes
    
    private var coordinator: MoviesCoordinator?
    private let interactor: MoviesInteractorProtocol
    
    var movies: [Movie] = []
    var delegate: MoviesViewModelDelegate?
    
    // MARK: - Life Cycle
    
    init(coordinator: MoviesCoordinator? = nil, interactor: MoviesInteractorProtocol = MoviesInteractor()) {
        self.coordinator = coordinator
        self.interactor = interactor
    }
    
    // MARK: - Navigation

    func presentMovieDetail(at row: Int) {
        coordinator?.presentMovieDetail(movieId: movies[row].id)
    }
    
    
    // MARK: - Custom Methods
    
    func fetchMovies() {
        interactor.fetchMoviesFromPage { result in
            switch result {
            case .success(let movieList):
                self.movies.append(contentsOf: movieList)
                self.delegate?.fetchMovies(error: nil)
            case .failure(let error):
                self.delegate?.fetchMovies(error: error)
            }
        }
    }
    
}
