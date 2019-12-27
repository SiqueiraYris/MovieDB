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

    @IBOutlet weak var loader: UIActivityIndicatorView!
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
        
        view.createGradientBackground(firstColor: UIColor.william.cgColor,
        secondColor: UIColor.nordic.cgColor)
        
        setupNavigation()
    }
    
    // MARK: - Setup Status Bar
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Custom Methods
    
    func setupNavigation() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = .nordic
        self.navigationController?.view.backgroundColor = .nordic
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
}

// MARK: - View Model Delegate

extension MoviesViewController: MoviesViewModelDelegate {
    
    func fetchMovies(error: Error?) {
        DispatchQueue.main.async {
            if let err = error {
                self.showErrorAlert(error: err)
            } else {
                self.moviesTableView.reloadData()
            }
            self.loader.stopAnimating()
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
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let currentSize = scrollView.contentSize.height
        let currentScrollPosition = scrollView.contentOffset.y

        if currentScrollPosition > currentSize * 0.8 {
            DispatchQueue.global(qos: .background).async {
                if let viewModel = self.viewModel {
                    viewModel.fetchMovies()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.presentMovieDetail(at: indexPath.row)
    }
    
}
