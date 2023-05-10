//
//  NetworkDataFetch.swift
//  VoioDenisKobylkovTest
//
//  Created by Denis Kobylkov on 30.03.2023.
//

import Foundation
class NetworkDataFetch {
    
    static let shared = NetworkDataFetch()
    
    private init() {}
    
    func FetchMovie(urlString: String, response: @escaping (Movies?, Error?)-> Void) {
        
        
        NetworkRequest.shared.requestData(urlString: urlString) {result in
            switch result {
            case .success(let data):
                do{
                    let movies = try JSONDecoder().decode(Movies.self, from: data)
                    response(movies, nil)
                } catch let error {
                    print("error from data", error)
                }
                
            case .failure(let error):
                print("error on data request \(error.localizedDescription)")
                response(nil, error)
            }
        }
    }
}
