//
//  MovieDetailViewController.swift
//  MovieDB
//
//  Created by Yris Siqueira da Silva on 20/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import UIKit
import ImageSlideshow

final class MovieDetailViewController: UIViewController {

   // MARK: - Attributes
    
    private var viewModel: MovieDetailViewModelProtocol?

    // MARK: - Outlets
    
    @IBOutlet weak var movieBanner: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDuration: UILabel!
    @IBOutlet weak var movieMainImage: UIImageView!
    @IBOutlet weak var movieOverview: UITextView!
    @IBOutlet weak var movieRatingView: UIView!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var movieImages: ImageSlideshow!
    
    // MARK: - Life Cycle
    
    init(viewModel: MovieDetailViewModelProtocol) {
        super.init(nibName: "MovieDetailViewController", bundle: Bundle.main)
        self.viewModel = viewModel
        self.viewModel?.delegate = self
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
        self.navigationController?.isNavigationBarHidden = true
    }
    
    // MARK: - Setup Status Bar
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - IB Actions
    
    @IBAction func didTapBackButton(_ sender: UIButton) {
        viewModel?.goBack()
    }
    
}

// MARK: - View Model Delegate

extension MovieDetailViewController: MovieDetailViewModelDelegate {
    
    func fetchMovieDetail(error: Error?) {
        DispatchQueue.main.async {
            if let err = error {
                self.showErrorAlert(error: err)
            } else {
                self.setupUI()
            }
        }
    }
    
}

extension MovieDetailViewController {
    
    // MARK: - Binds
    
    func setupUI() {
        movieTitle.text = viewModel?.movie.title
        movieOverview.text = viewModel?.movie.overview
        movieRating.text = viewModel?.movie.voteAverage.description
        
        if let time = viewModel?.movie.runtime {
            movieDuration.text = Date().convertDate(date: time)
        }
        
        if let image = viewModel?.movie.posterPath {
            movieMainImage.download(image: image)
            movieMainImage.addRoundedBorder(radious: 5.0, color: UIColor.caribbeanGreen.cgColor)
        }
        
        if let banner = viewModel?.movie.backdropPath {
            movieBanner.download(image: banner)
        }
        
        DispatchQueue.main.async {
            self.configureImageSlider()
        }
        
        movieRatingView.roundCorners(radious: 10.0)
    }
    
    // MARK: - Custom Methods
    
    func configureImageSlider() {
        let pageIndicator = UIPageControl()
        pageIndicator.currentPageIndicatorTintColor = .caribbeanGreen
        pageIndicator.pageIndicatorTintColor = .white
        
        movieImages.pageIndicator = pageIndicator
        movieImages.pageIndicatorPosition = PageIndicatorPosition(horizontal: .center, vertical: .under)
        movieImages.contentScaleMode = .scaleToFill
        movieImages.backgroundColor = .clear
        
        guard let sources = viewModel?.createImageSources() else { return }
        movieImages.setImageInputs(sources)
    }
    
}
