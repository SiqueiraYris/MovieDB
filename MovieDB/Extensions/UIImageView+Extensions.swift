//
//  UIImageView+Extensions.swift
//  MovieDB
//
//  Created by Yris Siqueira on 26/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func download(image url: String) {
        guard let imageURL = URL(string: url) else { return }
        
        let imageHelper = ImageHelper()
        imageHelper.downloadImage(url: imageURL) { image in
           self.image = image
        }
    }
    
}
