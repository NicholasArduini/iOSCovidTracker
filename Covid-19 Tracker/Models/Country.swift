//
//  Country.swift
//  Covid-19 Tracker
//
//  Created by Nicholas Arduini on 2020-06-14.
//  Copyright © 2020 Nicholas Arduini. All rights reserved.
//

import Foundation

class Country : GlobalStats {
    
    var country: String = ""
    var countryCode: String = ""
    var slug: String = ""
    private var dateString: String = ""
    
    enum CodingKeys: String, CodingKey {
        case country = "Country"
        case countryCode = "CountryCode"
        case slug = "Slug"
        case dateString = "Date"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        country = try container.decode(String.self, forKey: .country)
        countryCode = try container.decode(String.self, forKey: .countryCode)
        slug = try container.decode(String.self, forKey: .slug)
        dateString = try container.decode(String.self, forKey: .dateString)
        try super.init(from: decoder)
    }
}
