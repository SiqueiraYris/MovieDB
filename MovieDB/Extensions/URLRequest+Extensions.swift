//
//  URLRequest+Extensions.swift
//  MovieDB
//
//  Created by Yris Siqueira da Silva on 20/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import Foundation

extension URLRequest {
    
    public enum HTTPMethod: String {
        case get = "GET"
    }

    public var method: HTTPMethod? {
        get {
            guard let httpMethod = self.httpMethod else { return nil }
            let method = HTTPMethod(rawValue: httpMethod)
            return method
        }

        set {
            self.httpMethod = newValue?.rawValue
        }
    }
    
}

extension URLRequest {
    
    public init(url: URL, method: HTTPMethod, contentType: String?, body: Data?) {
        self.init(url: url)

        self.method = method
        self.setValue(contentType, forHTTPHeaderField: "Content-Type")
        self.httpBody = body
    }
    
}
