//
//  MoviesViewModel.swift
//  MovieDB
//
//  Created by Yris Siqueira da Silva on 19/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import Foundation

protocol MoviesViewModelProtocol {
    func presentMovieDetail()
}

final class MoviesViewModel: MoviesViewModelProtocol {
    
    // MARK: - Attributes
    
    private var coordinator: MoviesCoordinator?
    
    // MARK: - Life cycle
    
    init(coordinator: MoviesCoordinator) {
        self.coordinator = coordinator
    }
    
    // MARK: - Navigation

    func presentMovieDetail() {
        coordinator?.presentMovieDetail()
    }
    
}
