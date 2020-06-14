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
    
    init() {
        fetchCountriesSummary()
    }
    
    func fetchCountriesSummary () {
        CountryWebService().getCountrySummary() { [weak self] summary, error in
            guard let self = self else { return }
            if let summary = summary {
                self.countriesSummary = summary
            }
        }
    }
}
