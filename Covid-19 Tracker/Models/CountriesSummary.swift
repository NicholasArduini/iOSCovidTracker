//
//  CountriesSummary.swift
//  Covid-19 Tracker
//
//  Created by Nicholas Arduini on 2020-06-14.
//  Copyright © 2020 Nicholas Arduini. All rights reserved.
//

import Foundation

struct CountriesSummary : Codable {
    
    var countries = [Country]()
    var globalStats = GlobalStats()
    
    enum CodingKeys: String, CodingKey {
        case countries = "Countries"
        case globalStats = "Global"
    }
    
    func filteredCountries(countryName: String) -> [Country] {
        if (countryName.isEmpty) {
            return self.countries
        }
        return self.countries.filter { $0.country.lowercased().contains(countryName.lowercased()) }
    }
    
    mutating func sort() {
        self.countries = self.countries.sorted(by: { $0.totalConfirmed > $1.totalConfirmed })
    }
}

struct GlobalStats : Codable {
    
    var newConfirmed: Int = 0
    var totalConfirmed: Int = 0
    var newDeaths: Int = 0
    var totalDeaths: Int = 0
    var newRecovered: Int = 0
    var totalRecovered: Int = 0
    var totalActive: Int {
        return totalConfirmed - totalRecovered - totalDeaths
    }
    var newActive: Int {
        return newConfirmed - newRecovered - newDeaths
    }
    
    enum CodingKeys: String, CodingKey {
        case newConfirmed = "NewConfirmed"
        case totalConfirmed = "TotalConfirmed"
        case newDeaths = "NewDeaths"
        case totalDeaths = "TotalDeaths"
        case newRecovered = "NewRecovered"
        case totalRecovered = "TotalRecovered"
    }
}
