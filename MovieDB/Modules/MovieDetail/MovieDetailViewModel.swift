//
//  MovieDetailViewModel.swift
//  MovieDB
//
//  Created by Yris Siqueira da Silva on 20/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import Foundation

protocol MovieDetailViewModelProtocol {
    func goBack()
    func fetchMovieDetail()
}

// MARK: - View Model Delegate

protocol MovieDetailViewModelDelegate {
    func fetchMovieDetail(error: Error?)
}

final class MovieDetailViewModel: MovieDetailViewModelProtocol {
    
    // MARK: - Attributes
    
    private var coordinator: MovieDetailCoordinator?
    private let interactor: MovieDetailInteractorProtocol
    private var movieId: Int
    
    var movie: MovieDetail!
    var delegate: MovieDetailViewModelDelegate?
    
    // MARK: - Life Cycle
    
    init(coordinator: MovieDetailCoordinator, interactor: MovieDetailInteractorProtocol = MovieDetailInteractor(), movieId: Int) {
        self.coordinator = coordinator
        self.interactor = interactor
        self.movieId = movieId
    }
    
    // MARK: - Navigation

    func goBack() {
        coordinator?.goBack()
    }
    
    // MARK: - Custom Methods
    
    func fetchMovieDetail() {
        interactor.fetchMovieDetailById(id: self.movieId) { result in
            switch result {
            case .success(let movie):
                self.movie = movie
                self.delegate?.fetchMovieDetail(error: nil)
            case .failure(let error):
                self.delegate?.fetchMovieDetail(error: error)
            }
        }
    }
    
}
