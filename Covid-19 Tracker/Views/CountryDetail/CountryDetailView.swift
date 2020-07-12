//
//  CountryDetailView.swift
//  Covid-19 Tracker
//
//  Created by Nicholas Arduini on 2020-06-27.
//  Copyright © 2020 Nicholas Arduini. All rights reserved.
//

import SwiftUI

struct CountryDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject private var countryDetailVM : CountryDetailViewModel
    
    @State var selection = StatTypeFilter.confirmed
    
    init(country: Country) {
        self.countryDetailVM = CountryDetailViewModel(country: country)
    }
    
    var body: some View {
        ContentLoadingView(isLoading: $countryDetailVM.isLoading, errorMessage: $countryDetailVM.errorMessage, tryAgainClicked: {
            self.countryDetailVM.fetchCountryTotalStats()
        }) {
            VStack {
                HStack {
                    HeaderView(title: self.countryDetailVM.country.toString())
                    Spacer()
                }
                
                StatsView(globalStats: self.countryDetailVM.country).padding(.top)
                
                Picker(selection: Binding<StatTypeFilter>(
                    get: { self.countryDetailVM.statType },
                    set: { self.countryDetailVM.statType = $0 }), label: EmptyView()) {
                        Text(Constants.Strings.CONFIRMED).tag(StatTypeFilter.confirmed)
                        Text(Constants.Strings.ACTIVE).tag(StatTypeFilter.active)
                        Text(Constants.Strings.RECOVERED).tag(StatTypeFilter.recovered)
                        Text(Constants.Strings.DEATHS).tag(StatTypeFilter.deaths)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                .onReceive(self.countryDetailVM.$statType) { type in
                    self.countryDetailVM.buildLineGraphDataBasedOnFilter(statType: type)
                }
                ScrollView(.vertical) {
                    VStack {
                        VStack {
                            LineView(data: self.countryDetailVM.filteredHistoricData).padding(.horizontal)
                            Spacer()
                        }
                    }
                    
                }
                Spacer()
            }
        }
        .navigationBarHidden(false)
        .navigationBarTitle("", displayMode: .inline)
        .background(Color.clear)
        .onAppear(perform: {
            self.countryDetailVM.fetchCountryTotalStats()
        })
    }
}
