//
//  AppCoordinator.swift
//  MovieDB
//
//  Created by Yris Siqueira da Silva on 19/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import UIKit

final class AppCoordinator {
    
    // MARK: - Attributes
    
    private static var window: UIWindow? = {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        return appDelegate?.window
    }()
    
    // MARK: - Navigations
    
    static func start() {
        openMovies()
    }
    
    private static func openMovies() {
        let navigation = UINavigationController()
        
        let moviesCoordinator = MoviesCoordinator(presenter: navigation)
        moviesCoordinator.start()
        
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }
}
