//
//  Coordinator.swift
//  MovieDB
//
//  Created by Yris Siqueira da Silva on 19/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    
    func initModule() -> UIViewController?
    func start()
    
}

extension Coordinator {
    
    func start(){ } 
    func initModule() -> UIViewController? {
        return nil
    }
    
}
