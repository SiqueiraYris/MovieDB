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
        let viewController = MoviesViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
