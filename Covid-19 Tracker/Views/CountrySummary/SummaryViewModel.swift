//
//  SummaryViewModel.swift
//  Covid-19 Tracker
//
//  Created by Nicholas Arduini on 2020-06-14.
//  Copyright © 2020 Nicholas Arduini. All rights reserved.
//

import Foundation

enum StatTypeFilter {
    case confirmed
    case active
    case recovered
    case deaths
}

public class SummaryViewModel: ObservableObject {
    
    @Published var countriesSummary = CountriesSummary()
    @Published var isLoading = false
    @Published var statType = StatTypeFilter.confirmed
    
    init() {
        self.fetchCountriesSummary()
    }
    
    func fetchCountriesSummary () {
        self.isLoading = true
        CountryWebService().getCountrySummary() { [weak self] summary, error in
            guard let self = self else { return }
            if let summary = summary {
                self.countriesSummary = summary
                self.sortCountriesBasedOnFilter(statType: self.statType)
            }
            self.isLoading = false
        }
    }
    
    func sortCountriesBasedOnFilter (statType: StatTypeFilter) {
        switch statType {
        case .confirmed:
            self.countriesSummary.sortTotalConfirmed()
        case .active:
            self.countriesSummary.sortTotalActive()
        case .recovered:
            self.countriesSummary.sortTotalRecovered()
        case .deaths:
            self.countriesSummary.sortTotalDeaths()
        }
    }
}
