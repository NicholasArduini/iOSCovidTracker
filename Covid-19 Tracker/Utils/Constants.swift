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
    }
    
    public struct URLs {
        public static let BASE_URL = "https://api.covid19api.com/"
    }
}
