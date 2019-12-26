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
    private var movieId: Int
    
    var movie: Movie!
    var delegate: MovieDetailViewModelDelegate?
    
    // MARK: - Life Cycle
    
    init(coordinator: MovieDetailCoordinator, movieId: Int) {
        self.coordinator = coordinator
        self.movieId = movieId
    }
    
    // MARK: - Navigation

    func goBack() {
        coordinator?.goBack()
    }
    
    // MARK: - Custom Methods
    
    func fetchMovieDetail() {

    }
    
}
