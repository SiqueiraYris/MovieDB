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
    
    // MARK: - Outlets

    @IBOutlet weak var moviesTableView: UITableView! {
        didSet {
            moviesTableView.dataSource = self
            moviesTableView.delegate = self
            moviesTableView.register(UINib(nibName: MoviesTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: MoviesTableViewCell.identifier)
        }
    }
    
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
        
        self.title = "Top Movies"
        
        setupNavigation()
    }
    
    // MARK: - Custom Methods
    
    func setupNavigation() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = .nordic
        self.navigationController?.view.backgroundColor = .nordic
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        view.createGradientBackground(firstColor: UIColor.william.cgColor,
                                      secondColor: UIColor.nordic.cgColor)
    }
    
}

// MARK: - View Model Delegate

extension MoviesViewController: MoviesViewModelDelegate {
    
    func fetchMovies(error: Error?) {
        if let err = error {
            
        } else {
            DispatchQueue.main.async {
                self.moviesTableView.reloadData()
            }
        }
    }
    
}

// MARK: - Table View Data Source

extension MoviesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.movies.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: MoviesTableViewCell.identifier, for: indexPath) as? MoviesTableViewCell, let movies = viewModel?.movies {
            let cellViewModel = MoviesCellViewModel(with: movies[indexPath.row])
            cell.configure(with: cellViewModel)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
}

// MARK: - Table View Delegate

extension MoviesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        171
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.presentMovieDetail(at: indexPath.row)
    }

}
