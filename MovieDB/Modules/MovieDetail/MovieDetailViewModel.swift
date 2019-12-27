//
//  MovieDetailViewModel.swift
//  MovieDB
//
//  Created by Yris Siqueira da Silva on 20/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import Foundation
import ImageSlideshow

// MARK: - View Model Protocol

protocol MovieDetailViewModelProtocol {
    var movie: MovieDetail? { get }
    var images: [Backdrop] { get }
    var delegate: MovieDetailViewModelDelegate? { get set }
    
    func goBack()
    func fetchMovieDetail()
    func createImageSources() -> [KingfisherSource]
}

// MARK: - View Model Delegate

protocol MovieDetailViewModelDelegate {
    func fetchMovieDetail(error: Error?)
}

final class MovieDetailViewModel: MovieDetailViewModelProtocol {
    
    // MARK: - Attributes
    
    private var coordinator: MovieDetailCoordinator?
    private let interactor: MovieDetailInteractorProtocol
    private var movieId: Int
    
    var movie: MovieDetail?
    var images: [Backdrop] = []
    var delegate: MovieDetailViewModelDelegate?
    
    // MARK: - Life Cycle
    
    init(coordinator: MovieDetailCoordinator? = nil, interactor: MovieDetailInteractorProtocol = MovieDetailInteractor(), movieId: Int) {
        self.coordinator = coordinator
        self.interactor = interactor
        self.movieId = movieId
    }
    
    // MARK: - Navigation

    func goBack() {
        coordinator?.goBack()
    }
    
    // MARK: - Custom Methods
    
    func fetchMovieDetail() {
        interactor.fetchMovieDetailById(id: self.movieId) { result in
            switch result {
            case .success(let movie):
                self.movie = movie
                self.fetchMovieImages()
            case .failure(let error):
                self.delegate?.fetchMovieDetail(error: error)
            }
        }
    }
    
    func fetchMovieImages() {
        interactor.fetchMovieImages(id: self.movieId) { result in
            switch result {
            case .success(let images):
                self.images = images
                self.delegate?.fetchMovieDetail(error: nil)
            case .failure(let error):
                self.delegate?.fetchMovieDetail(error: error)
            }
        }
    }
    
    func createImageSources() -> [KingfisherSource] {
        var sources: [KingfisherSource] = []
        _ = images.prefix(5).map {
            guard let filePath = $0.filePath else { return }
            if let kfSource = KingfisherSource(urlString: "https://image.tmdb.org/t/p/w500/\(filePath)") {
                sources.append(kfSource)
            }
        }
        return  sources
    }
    
}
