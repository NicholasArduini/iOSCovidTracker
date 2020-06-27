//
//  SummaryView.swift
//  Covid-19 Tracker
//
//  Created by Nicholas Arduini on 2020-06-14.
//  Copyright © 2020 Nicholas Arduini. All rights reserved.
//

import SwiftUI

struct SummaryView: View {
    
    @State private var searchText = ""
    @State private var isSearching = false
    
    @ObservedObject private var summaryViewModel = SummaryViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                ZStack {
                    VStack {
                        HStack {
                            if isSearching {
                                HStack {
                                    Image(systemName: Constants.Icons.MAGNIFYING_GLASS)
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.tertiaryLabel)
                                        .transition(.scale)
                                        .frame(width: nil, height: isSearching ? nil : 0, alignment: .center)
                                        .padding(.leading)
                                    UITextFieldView(text: $searchText, placeholder: Constants.Strings.SEARCH_COUNTRIES, isFirstResponder: true)
                                        .frame(width: nil, height: 40, alignment: .center)
                                }
                                .background(Color.systemGray5)
                                .cornerRadius(20)
                                .padding(.horizontal)
                                .transition(.scale)
                            }
                            if !isSearching {
                                HeaderView(title: Constants.Strings.COVID_19_TITLE)
                            }
                            Spacer()
                            if !isSearching {
                                IconButton(imageIconName: Constants.Icons.ARROW_CLOCKWISE_CIRCLE_FILL, onTap: {
                                    self.summaryViewModel.fetchCountriesSummary()
                                })
                                    .padding(.trailing, 4)
                            }
                            IconButton(imageIconName: isSearching ? Constants.Icons.CHEVRON_RIGHT_CIRCLE_FILL : Constants.Icons.MAGNIFYING_GLASS_CIRCLE_FILL, onTap: {
                                self.isSearching.toggle()
                            })
                                .padding(.trailing)
                        }
                        .padding(.vertical)
                        
                        if !isSearching {
                            StatsView(globalStats: summaryViewModel.countriesSummary.globalStats).transition(.scale)
                            Picker(selection: Binding<StatTypeFilter>(
                                get: { self.summaryViewModel.statType },
                                set: { self.summaryViewModel.statType = $0 }), label: Text("")) {
                                    Text(Constants.Strings.CONFIRMED).tag(StatTypeFilter.confirmed)
                                    Text(Constants.Strings.ACTIVE).tag(StatTypeFilter.active)
                                    Text(Constants.Strings.RECOVERED).tag(StatTypeFilter.recovered)
                                    Text(Constants.Strings.DEATHS).tag(StatTypeFilter.deaths)
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .padding(.horizontal)
                            .transition(.scale)
                            .onReceive(summaryViewModel.$statType) { type in
                                self.summaryViewModel.sortCountriesBasedOnFilter(statType: type)
                            }
                        }
                        
                        List(summaryViewModel.countriesSummary.filteredCountries(countryName: searchText), id: \.country) { country in
                            NavigationLink(destination: CountryDetailView(country: country)) {
                                CountryListItem(country: country, statType: self.summaryViewModel.statType)
                            }
                        }
                    }
                }
                ContentLoadingView(isLoading: $summaryViewModel.isLoading, errorMessage: $summaryViewModel.errorMessage) {
                    self.summaryViewModel.fetchCountriesSummary()
                }
            }
            .navigationBarHidden(true)
            .navigationBarTitle("")
        }
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView().environment(\.colorScheme, .dark)
    }
}
