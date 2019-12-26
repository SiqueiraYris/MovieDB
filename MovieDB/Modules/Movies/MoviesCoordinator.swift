//
//  MoviesCoordinator.swift
//  MovieDB
//
//  Created by Yris Siqueira da Silva on 19/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import UIKit

final class MoviesCoordinator: Coordinator {

    // MARK: - Attributes
    
    private weak var navigationController: UINavigationController?
    
    // MARK: - Life Cycle
    
    init(presenter: UINavigationController) {
        navigationController = presenter
    }
    
    func start() {
        let viewModel = MoviesViewModel(coordinator: self)
        let viewController = MoviesViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    // MARK: - Navigations
    
    func presentMovieDetail(movieId: Int) {
        let moviesCoordinator = MovieDetailCoordinator(presenter: navigationController, movieId: movieId)
        moviesCoordinator.start()
    }
    
}
