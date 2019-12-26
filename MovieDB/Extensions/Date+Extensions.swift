//
//  Date+Extensions.swift
//  MovieDB
//
//  Created by Yris Siqueira on 26/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import Foundation

extension Date {
    
    // MARK: - Convert Seconds to String
    
    func convertDate(date: Int) -> String {
        let hours = Int(date) / 60
        let minutes = Int(date) % 60
        
        return "Duração \(hours)h \(minutes)min"
    }
    
}
