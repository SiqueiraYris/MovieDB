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

    
    // MARK: - Life cycle
    
    init(viewModel: MoviesViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: "MoviesViewController", bundle: Bundle.main)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
