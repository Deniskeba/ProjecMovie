//
//  NetworkRequest.swift
//  VoioDenisKobylkovTest
//
//  Created by Denis Kobylkov on 29.03.2023.
//

import Foundation

class NetworkService {
    
    
    func request(URL url:String, completion: @escaping (Result< Response, Error>) -> Void) {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print("Some error")
                    completion(.failure(error))
                    return
                }
                guard let data = data else { return }
                do {
                    let movies = try
                    JSONDecoder().decode(Response.self, from: data)
                    completion(.success(movies))
                } catch let JsonError{
                    print("Failed to decode JSON", JsonError)
                    completion(.failure(JsonError  ))
            
                }
            }
        }.resume()
    }
}
