//
//  CountryDetailViewModel.swift
//  Covid-19 Tracker
//
//  Created by Nicholas Arduini on 2020-06-29.
//  Copyright © 2020 Nicholas Arduini. All rights reserved.
//

import Foundation

public class CountryDetailViewModel: ObservableObject {
    
    @Published var isLoading = false
    @Published var errorMessage = ""
    @Published var statType = StatTypeFilter.confirmed
    @Published var filteredHistoricData = [Double]()
    
    private var countriesTotalStats = [CountryStat]()
    let country: Country
    
    init(country: Country) {
        self.country = country
    }
    
    func fetchCountryTotalStats () {
        self.isLoading = true
        self.errorMessage = ""
        CountryWebService().getTotalCountryStatsFromDayOne(countrySlug: country.slug) { [weak self] countryStats, error in
            guard let self = self else { return }
            if let countryStats = countryStats {
                self.countriesTotalStats = countryStats
                self.buildLineGraphDataBasedOnFilter(statType: self.statType)
            } else if let error = error {
                self.errorMessage = error
            }
            self.isLoading = false
        }
    }
    
    func buildLineGraphDataBasedOnFilter (statType: StatTypeFilter) {
        switch statType {
        case .confirmed:
            self.filteredHistoricData = self.countriesTotalStats.map({ Double($0.confirmed) })
        case .active:
            self.filteredHistoricData = self.countriesTotalStats.map({ Double($0.active) })
        case .recovered:
            self.filteredHistoricData = self.countriesTotalStats.map({ Double($0.recovered) })
        case .deaths:
            self.filteredHistoricData = self.countriesTotalStats.map({ Double($0.deaths) })
        }
    }
}
