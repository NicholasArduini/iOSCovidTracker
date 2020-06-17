//
//  CountryListItem.swift
//  Covid-19 Tracker
//
//  Created by Nicholas Arduini on 2020-06-16.
//  Copyright © 2020 Nicholas Arduini. All rights reserved.
//

import SwiftUI

struct CountryListItem: View {
    
    let country : Country
        
    var body: some View {
        HStack {
            Text("\(country.countryCode.toFlagEmoji())")
            Text("\(country.country)")
            Spacer()
            Text("+\(country.newConfirmed)").foregroundColor(.secondaryLabel).font(.caption).bold()
            Text("\(country.totalConfirmed)").font(.callout).bold()
        }
        
    }
}
