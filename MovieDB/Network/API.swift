//
//  API.swift
//  MovieDB
//
//  Created by Yris Siqueira da Silva on 20/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import Foundation

class API {
    
    func request(queryParams: Dictionary<String, String>?, urlPath: String, method: URLRequest.HTTPMethod = .get, contentType: String = "Content-Type", body: Data? = nil, completion: @escaping (Result<Data, Error>) -> Void) {
        var requestUrl: URL!
        if let query = queryParams {
            guard let url = queryParamsHandler(params: query, path: urlPath) else { return }
            requestUrl = url
        } else {
            guard let url = URL(string: urlPath) else { return }
            requestUrl = url
        }

        let request = URLRequest(url: requestUrl, method: method, contentType: contentType, body: body)
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            if let err = error {
                completion(.failure(err))
            }
            else if let data = data {
                completion(.success(data))
            }
        })
        task.resume()
    }

    func queryParamsHandler(params: Dictionary<String, String>, path: String) -> URL? {
        var iterator = params.makeIterator()
        guard var url = URLComponents(string: path) else { return nil }
        var queryItems: [URLQueryItem] = []

        while let value = iterator.next() {
            queryItems.append(URLQueryItem(name: value.key, value: value.value))
        }

        url.queryItems = queryItems
        
        guard let finalUrl = url.url else { return nil }
        
        return finalUrl
    }
}

