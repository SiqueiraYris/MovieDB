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
}

final class MovieDetailViewModel: MovieDetailViewModelProtocol {
    
    // MARK: - Attributes
    
    private var coordinator: MovieDetailCoordinator?
    
    // MARK: - Life cycle
    
    init(coordinator: MovieDetailCoordinator) {
        self.coordinator = coordinator
    }
    
    // MARK: - Navigation

    func goBack() {
        coordinator?.goBack()
    }
    
}
