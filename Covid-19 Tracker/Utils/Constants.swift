//
//  Constants.swift
//  Covid-19 Tracker
//
//  Created by Nicholas Arduini on 2020-06-14.
//  Copyright © 2020 Nicholas Arduini. All rights reserved.
//

import Foundation

public struct Constants {
    
    public struct Strings {
        public static let INVALID_URL_ERROR_MESSAGE = "The URL being called seems to be invalid"
        public static let INVALID_DATA_ERROR_MESSAGE = "We have encountered a data formatting issue"
        public static let UNEXPECTED_ERROR_MESSAGE = "We have encountered an unexpected error"
        
        public static let COVID_19 = "Covid 19"
        public static let CONFIRMED = "Confirmed"
        public static let RECOVERED = "Recovered"
        public static let ACTIVE = "Active"
        public static let DEATHS = "Deaths"
        public static let SEARCH_COUNTRIES = "Search countries"
        public static let TRY_AGAIN = "Try again"
    }
    
    public struct URLs {
        public static let BASE_URL = "https://api.covid19api.com/"
    }
    
    public struct Images {
        public static let MAGNIFYING_GLASS = "magnifyingglass"
        public static let MAGNIFYING_GLASS_CIRCLE_FILL = "magnifyingglass.circle.fill"
        public static let CHEVRON_RIGHT_CIRCLE_FILL = "chevron.right.circle.fill"
    }
}
