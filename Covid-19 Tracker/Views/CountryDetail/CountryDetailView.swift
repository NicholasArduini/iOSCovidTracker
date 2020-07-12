//
//  CountryDetailView.swift
//  Covid-19 Tracker
//
//  Created by Nicholas Arduini on 2020-06-27.
//  Copyright © 2020 Nicholas Arduini. All rights reserved.
//

import SwiftUI
import SwiftUICharts

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
                
                StatTypePicker(statType: self.$countryDetailVM.statType, onChange: { type in
                    self.countryDetailVM.buildLineGraphDataBasedOnFilter(statType: type)
                })
                .padding(.horizontal)
                
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
