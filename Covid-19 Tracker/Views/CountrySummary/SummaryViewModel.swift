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
    
    init() {
        fetchCountriesSummary()
    }
    
    func fetchCountriesSummary () {
        self.isLoading = true
        CountryWebService().getCountrySummary() { [weak self] summary, error in
            guard let self = self else { return }
            if let summary = summary {
                self.countriesSummary = summary
                self.countriesSummary.sort()
            }
            self.isLoading = false
        }
    }
    
//    func searchCoutry (country: String) {
//        print("searching \(country)")
//        self.countriesSummary.countries = self.countriesSummary.countries.filter { $0.country.lowercased().contains(country.lowercased()) }
//    }
}
