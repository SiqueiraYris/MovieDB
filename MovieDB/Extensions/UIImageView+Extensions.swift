//
//  UIImageView+Extensions.swift
//  MovieDB
//
//  Created by Yris Siqueira on 26/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import UIKit

extension UIImageView {
    
    // MARK: - Download Image
    
    func download(image url: String) {
        guard let imageURL = URL(string: url) else { return }
        
        let imageHelper = ImageHelper()
        imageHelper.downloadImage(url: imageURL) { image in
           self.image = image
        }
    }
    
}

extension UIImageView {
    
    // MARK: - Add Rounded Border
    
    func addRoundedBorder(radious: CGFloat, color: CGColor, borderWidth: CGFloat = 1.0) {
        self.layer.cornerRadius = radious
        self.layer.borderColor = color
        self.layer.borderWidth = borderWidth
        self.layer.masksToBounds = true
    }
    
}
