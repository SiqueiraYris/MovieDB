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
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var movieBanner: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDuration: UILabel!
    @IBOutlet weak var movieMainImage: UIImageView!
    @IBOutlet weak var movieOverview: UITextView!
    @IBOutlet weak var movieRatingView: UIView!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var movieImages: ImageSlideshow!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var backView: UIView! {
        didSet {
            let tap = UITapGestureRecognizer(target: self, action: #selector(didTapBack(_:)))
            backView.addGestureRecognizer(tap)
        }
    }
    @IBOutlet weak var castCollectionView: UICollectionView! {
        didSet {
            castCollectionView.dataSource = self
            setupCollectionCell()
        }
    }
    
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
        setupUI(hidden: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        contentView.createGradientBackground(firstColor: UIColor.william.cgColor,
        secondColor: UIColor.nordic.cgColor)
    }
    
    // MARK: - Setup Status Bar
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Handle With Gesture
    
     @objc func didTapBack(_ sender: UITapGestureRecognizer? = nil) {
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
                self.bindUI()
                self.setupUI(hidden: false)
            }
            self.loader.stopAnimating()
        }
    }
    
}

extension MovieDetailViewController {
    
    // MARK: - Setup UI
    
    func setupUI(hidden: Bool) {
        movieTitle.isHidden = hidden
        movieOverview.isHidden = hidden
        movieRatingView.isHidden = hidden
        movieBanner.isHidden = hidden
        movieMainImage.isHidden = hidden
        movieDuration.isHidden = hidden
        movieImages.isHidden = hidden
        castCollectionView.isHidden = hidden
    }
    
    // MARK: - Binds
    
    func bindUI() {
        movieTitle.text = viewModel?.movie?.title
        movieOverview.text = viewModel?.movie?.overview
        movieRating.text = viewModel?.movie?.voteAverage.description
        
        if let time = viewModel?.movie?.runtime {
            movieDuration.text = Date().convertDate(date: time)
        }
        
        if let image = viewModel?.movie?.posterPath {
            movieMainImage.download(image: image)
            movieMainImage.addRoundedBorder(radious: 5.0, color: UIColor.caribbeanGreen.cgColor)
        }
        
        if let banner = viewModel?.movie?.backdropPath {
            movieBanner.download(image: banner)
        }
        
        DispatchQueue.main.async {
            self.configureImageSlider()
            self.castCollectionView.reloadData()
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
    
    func setupCollectionCell() {
        let nib = UINib(nibName: "CastCollectionViewCell", bundle: nil)
        castCollectionView?.register(nib, forCellWithReuseIdentifier: CastCollectionViewCell.identifier)
        
        if let flowLayout = self.castCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.itemSize = CGSize(width: 120.0, height: 140.0)
        }
    }
    
}

// MARK: - Collection View Data Source

extension MovieDetailViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.movie?.credits?.cast?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CastCollectionViewCell.identifier,
                                                         for: indexPath) as? CastCollectionViewCell, let cast = viewModel?.movie?.credits?.cast {
            let cellViewModel = CastCellViewModel(with: cast[indexPath.row])
            cell.configure(with: cellViewModel)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }

}
