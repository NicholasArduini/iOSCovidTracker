//
//  Country.swift
//  Covid-19 Tracker
//
//  Created by Nicholas Arduini on 2020-06-14.
//  Copyright © 2020 Nicholas Arduini. All rights reserved.
//

import Foundation

class CountryStat : Decodable {
    
    var country: String = ""
    var countryCode: String = ""
    var confirmed: Int = 0
    var deaths: Int = 0
    var recovered: Int = 0
    var active: Int = 0
    private var dateString: String = ""
    
    enum CodingKeys: String, CodingKey {
        case country = "Country"
        case countryCode = "CountryCode"
        case confirmed = "Confirmed"
        case deaths = "Deaths"
        case recovered = "Recovered"
        case active = "Active"
        case dateString = "Date"
    }
}


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
    
    func toString() -> String {
        return "\(self.countryCode.toFlagEmoji()) \(self.country)"
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
