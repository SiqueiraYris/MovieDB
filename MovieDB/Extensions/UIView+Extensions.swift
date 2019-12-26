//
//  UIView+Extensions.swift
//  MovieDB
//
//  Created by Yris Siqueira on 25/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import UIKit

extension UIView {
    
    // MARK: - Round Corners
    
    func roundCorners(radious: CGFloat) {
        self.layer.cornerRadius = radious
        self.layer.masksToBounds = true
    }
    
    
    // MARK: - Gradient Background
    
    func createGradientBackground(firstColor: CGColor, secondColor: CGColor) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [firstColor, secondColor]
        gradient.locations = [0.0 , 1.0]
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.frame.size.width, height: self.frame.size.height)

        self.layer.insertSublayer(gradient, at: 0)
    }
    
}
