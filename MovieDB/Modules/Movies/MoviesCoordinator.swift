//
//  MoviesCoordinator.swift
//  MovieDB
//
//  Created by Yris Siqueira da Silva on 19/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import Foundation
import UIKit

final class MoviesCoordinator: Coordinator {

    // MARK: - Attributes
    
    private weak var navigationController: UINavigationController?
    
    // MARK: - Life cycle
    
    init(presenter: UINavigationController) {
        navigationController = presenter
    }
    
    func start() {
        let viewModel = MoviesViewModel(coordinator: self)
        let viewController = MoviesViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func presentMovieDetail() {
        let moviesCoordinator = MovieDetailCoordinator(presenter: navigationController)
        moviesCoordinator.start()
    }
    
}