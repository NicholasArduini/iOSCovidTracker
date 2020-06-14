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
}

struct GlobalStats : Codable {
    
    var newConfirmed: Int = 0
    var totalConfirmed: Int = 0
    var newDeaths: Int = 0
    var totalDeaths: Int = 0
    var newRecovered: Int = 0
    var totalRecovered: Int = 0
    
    enum CodingKeys: String, CodingKey {
        case newConfirmed = "NewConfirmed"
        case totalConfirmed = "TotalConfirmed"
        case newDeaths = "NewDeaths"
        case totalDeaths = "TotalDeaths"
        case newRecovered = "NewRecovered"
        case totalRecovered = "TotalRecovered"
    }
}
