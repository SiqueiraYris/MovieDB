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
    
    // MARK: - Life cycle
    
    init(presenter: UINavigationController?) {
        navigationController = presenter
    }
    
    func start() {
        let viewModel = MovieDetailViewModel(coordinator: self)
        let viewController = MovieDetailViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func goBack() {
    }
    
}
