//
//  NetworkManager.swift
//  Covid-19 Tracker
//
//  Created by Nicholas Arduini on 2020-06-14.
//  Copyright © 2020 Nicholas Arduini. All rights reserved.
//

import Foundation

class NetworkManager {
    
    func getModelFromUrl<T : Decodable>(urlString: String, type: T.Type, completion: @escaping (T?, String?) -> ()) {
        
        guard let url = URL(string: urlString) else {
            completion(nil, Constants.Strings.INVALID_URL_ERROR_MESSAGE)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            var response : T?
            var errorMessage : String?
            
            if let data = data {
                do {
                    response = try JSONDecoder().decode(T.self, from: data)
                } catch {
                    errorMessage = Constants.Strings.INVALID_DATA_ERROR_MESSAGE
                    NSLog("JSON error: \(error.localizedDescription)")
                }
            } else if let error = error {
                // erros such as invalid host name or no internet connection
                errorMessage = error.localizedDescription
                NSLog(error.localizedDescription)
            } else {
                errorMessage = Constants.Strings.UNEXPECTED_ERROR_MESSAGE
            }
            
            DispatchQueue.main.async {
                completion(response, errorMessage)
            }
            
        }.resume()
    }
}
