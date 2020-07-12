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
        let urlString = Constants.URLs.SUMMARY
        
        NetworkManager().getModelFromUrl(urlString: urlString, type: CountriesSummary.self)  { summary, errorMessage in
            completion(summary, errorMessage)
        }
    }
    
    func getTotalCountryStatsFromDayOne(countrySlug: String, completion: @escaping ([CountryStat]?, String?) -> ()) {
        let urlString = Constants.URLs.TOTAL_DAY_ONE_COUNTRY + countrySlug
        
        NetworkManager().getModelFromUrl(urlString: urlString, type: [CountryStat].self)  { countries, errorMessage in
            completion(countries, errorMessage)
        }
    }
    
}
