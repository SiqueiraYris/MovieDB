//
//  MoviesViewController.swift
//  MovieDB
//
//  Created by Yris Siqueira da Silva on 19/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import UIKit

final class MoviesViewController: UIViewController {
    
    // MARK: - Attributes
    
    private var viewModel: MoviesViewModelProtocol?

    
    // MARK: - Life Cycle
    
    init(viewModel: MoviesViewModelProtocol) {
        super.init(nibName: "MoviesViewController", bundle: Bundle.main)
        self.viewModel = viewModel
        self.viewModel?.delegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        viewModel?.fetchMovies()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

// MARK: - View Model Delegate

extension MoviesViewController: MoviesViewModelDelegate {
    
    func fetchMovies(error: Error?) {
        if let err = error {
            
        } else {
            
        }
    }
    
}
