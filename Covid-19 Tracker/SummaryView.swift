//
//  SummaryView.swift
//  Covid-19 Tracker
//
//  Created by Nicholas Arduini on 2020-06-14.
//  Copyright © 2020 Nicholas Arduini. All rights reserved.
//

import SwiftUI
import Combine

struct SummaryView: View {
    
    @ObservedObject private var summaryViewModel = SummaryViewModel()
    
    var body: some View {
        List(summaryViewModel.countriesSummary.countries, id: \.country) { country in
            Text("\(country.country) - \(country.totalConfirmed)")
        }
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
    }
}
