//
//  CountryWebService.swift
//  Covid-19 Tracker
//
//  Created by Nicholas Arduini on 2020-06-14.
//  Copyright © 2020 Nicholas Arduini. All rights reserved.
//

import Foundation

class CountryWebService {
    
    func getCountrySummary(completion: @escaping (CountriesSummary?, String?) -> ()) {
        let urlString = Constants.URLs.BASE_URL + "summary"
        
        NetworkManager().getModelFromUrl(urlString: urlString, type: CountriesSummary.self)  { summary, errorMessage in
            completion(summary, errorMessage)
        }
    }
    
}
