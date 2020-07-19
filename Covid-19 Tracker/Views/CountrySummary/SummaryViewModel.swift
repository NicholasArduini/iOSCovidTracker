//
//  SummaryViewModel.swift
//  Covid-19 Tracker
//
//  Created by Nicholas Arduini on 2020-06-14.
//  Copyright © 2020 Nicholas Arduini. All rights reserved.
//

import Foundation

public class SummaryViewModel: ObservableObject {
    
    @Published var countriesSummary = CountriesSummary()
    @Published var isLoading = false
    @Published var errorMessage = ""
    @Published var statType = StatTypeFilter.confirmed
    
    init() {
        self.fetchCountriesSummary()
    }
    
    func fetchCountriesSummary () {
        self.isLoading = true
        self.errorMessage = ""
        CountryWebService().getCountrySummary() { [weak self] summary, error in
            guard let self = self else { return }
            if let summary = summary {
                self.countriesSummary = summary
                self.sortCountriesBasedOnFilter(statType: self.statType)
            } else if let error = error {
                self.errorMessage = error
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
