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
    let statType : StatTypeFilter
    
    var body: some View {
        HStack {
            Text(country.countryCode.toFlagEmoji())
            Text(country.country)
            Spacer()
            if (statType == StatTypeFilter.confirmed) {
                CountryListItemStat(totalStat: country.totalConfirmed, newStat: country.newConfirmed)
            } else if (statType == StatTypeFilter.active) {
                CountryListItemStat(totalStat: country.totalActive, newStat: country.newActive)
            } else if (statType == StatTypeFilter.recovered) {
                CountryListItemStat(totalStat: country.totalRecovered, newStat: country.newRecovered)
            } else if (statType == StatTypeFilter.deaths) {
                CountryListItemStat(totalStat: country.totalDeaths, newStat: country.newDeaths)
            }
        }
    }
}

private struct CountryListItemStat: View {
    
    let totalStat : Int
    let newStat : Int
    
    var body: some View {
        HStack {
            Text(newStat.toPlusMinusString()).foregroundColor(.secondaryLabel).font(.caption).bold()
            Text("\(totalStat)").font(.callout).bold()
        }
    }
}
