//
//  CountriesSummary.swift
//  Covid-19 Tracker
//
//  Created by Nicholas Arduini on 2020-06-14.
//  Copyright © 2020 Nicholas Arduini. All rights reserved.
//

import Foundation

class CountriesSummary : Decodable {
    
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
    
    func sortTotalConfirmed() {
        self.countries = self.countries.sorted(by: { $0.totalConfirmed > $1.totalConfirmed })
    }
    
    func sortTotalActive() {
        self.countries = self.countries.sorted(by: { $0.totalActive > $1.totalActive })
    }
    
    func sortTotalRecovered() {
        self.countries = self.countries.sorted(by: { $0.totalRecovered > $1.totalRecovered })
    }
    
    func sortTotalDeaths() {
        self.countries = self.countries.sorted(by: { $0.totalDeaths > $1.totalDeaths })
    }
}

class GlobalStats : Decodable {
    
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
    
    init() {
        
    }
    
    enum CodingKeys: String, CodingKey {
        case newConfirmed = "NewConfirmed"
        case totalConfirmed = "TotalConfirmed"
        case newDeaths = "NewDeaths"
        case totalDeaths = "TotalDeaths"
        case newRecovered = "NewRecovered"
        case totalRecovered = "TotalRecovered"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        newConfirmed = try container.decode(Int.self, forKey: .newConfirmed)
        totalConfirmed = try container.decode(Int.self, forKey: .totalConfirmed)
        newDeaths = try container.decode(Int.self, forKey: .newDeaths)
        totalDeaths = try container.decode(Int.self, forKey: .totalDeaths)
        newRecovered = try container.decode(Int.self, forKey: .newRecovered)
        totalRecovered = try container.decode(Int.self, forKey: .totalRecovered)
    }
}
