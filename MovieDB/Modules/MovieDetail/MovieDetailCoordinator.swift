//
//  MovieDetailCoordinator.swift
//  MovieDB
//
//  Created by Yris Siqueira da Silva on 20/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import Foundation
import UIKit

final class MovieDetailCoordinator: Coordinator {

    // MARK: - Attributes
    
    private weak var navigationController: UINavigationController?
    private var movieId: Int
    
    // MARK: - Life Cycle
    
    init(presenter: UINavigationController?, movieId: Int) {
        self.navigationController = presenter
        self.movieId = movieId
    }
    
    func start() {
        let viewModel = MovieDetailViewModel(coordinator: self, movieId: self.movieId)
        let viewController = MovieDetailViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    // MARK: - Navigation
    
    func goBack() {
        
    }
    
}
