//
//  MovieDetailViewController.swift
//  MovieDB
//
//  Created by Yris Siqueira da Silva on 20/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import UIKit

final class MovieDetailViewController: UIViewController {

   // MARK: - Attributes
    
    private var viewModel: MovieDetailViewModelProtocol?

    
    // MARK: - Life cycle
    
    init(viewModel: MovieDetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: "MovieDetailViewController", bundle: Bundle.main)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        viewModel?.fetchMovieDetail()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

// MARK: - View Model Delegate

extension MovieDetailViewController: MovieDetailViewModelDelegate {
    
    func fetchMovieDetail(error: Error?) {
        if let err = error {
            
        } else {
            
        }
    }
    
}
