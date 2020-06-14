//
//  Country.swift
//  Covid-19 Tracker
//
//  Created by Nicholas Arduini on 2020-06-14.
//  Copyright © 2020 Nicholas Arduini. All rights reserved.
//

import Foundation

struct Country : Codable {
    
    var country: String = ""
    var countryCode: String = ""
    var slug: String = ""
    var newConfirmed: Int = 0
    var totalConfirmed: Int = 0
    var newDeaths: Int = 0
    var totalDeaths: Int = 0
    var newRecovered: Int = 0
    var totalRecovered: Int = 0
    private var dateString: String = ""
    
    enum CodingKeys: String, CodingKey {
        case country = "Country"
        case countryCode = "CountryCode"
        case slug = "Slug"
        case newConfirmed = "NewConfirmed"
        case totalConfirmed = "TotalConfirmed"
        case newDeaths = "NewDeaths"
        case totalDeaths = "TotalDeaths"
        case newRecovered = "NewRecovered"
        case totalRecovered = "TotalRecovered"
        case dateString = "Date"
    }
}
