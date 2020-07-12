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
    
    @ObservedObject private var summaryVM = SummaryViewModel()
    
    var body: some View {
        NavigationView {
            ContentLoadingView(isLoading: $summaryVM.isLoading, errorMessage: $summaryVM.errorMessage, tryAgainClicked: {
                self.summaryVM.fetchCountriesSummary()
            }) {
                VStack {
                    HStack {
                        if self.isSearching {
                            HStack {
                                Image(systemName: Constants.Icons.MAGNIFYING_GLASS)
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.tertiaryLabel)
                                    .transition(.scale)
                                    .frame(width: nil, height: self.isSearching ? nil : 0, alignment: .center)
                                    .padding(.leading)
                                UITextFieldView(text: self.$searchText, placeholder: Constants.Strings.SEARCH_COUNTRIES, isFirstResponder: true)
                                    .frame(width: nil, height: 40, alignment: .center)
                            }
                            .background(Color.systemGray5)
                            .cornerRadius(20)
                            .padding(.horizontal)
                            .transition(.scale)
                        }
                        if !self.isSearching {
                            HeaderView(title: Constants.Strings.COVID_19_TITLE)
                        }
                        Spacer()
                        if !self.isSearching {
                            IconButton(imageIconName: Constants.Icons.ARROW_CLOCKWISE_CIRCLE_FILL, onTap: {
                                self.summaryVM.fetchCountriesSummary()
                            })
                                .padding(.trailing, 4)
                        }
                        IconButton(imageIconName: self.isSearching ? Constants.Icons.CHEVRON_RIGHT_CIRCLE_FILL : Constants.Icons.MAGNIFYING_GLASS_CIRCLE_FILL, onTap: {
                            self.isSearching.toggle()
                        })
                            .padding(.trailing)
                    }
                    .padding(.vertical)
                    
                    if !self.isSearching {
                        StatsView(globalStats: self.summaryVM.countriesSummary.globalStats).transition(.scale)
                        Picker(selection: Binding<StatTypeFilter>(
                            get: { self.summaryVM.statType },
                            set: { self.summaryVM.statType = $0 }), label: EmptyView()) {
                                Text(Constants.Strings.CONFIRMED).tag(StatTypeFilter.confirmed)
                                Text(Constants.Strings.ACTIVE).tag(StatTypeFilter.active)
                                Text(Constants.Strings.RECOVERED).tag(StatTypeFilter.recovered)
                                Text(Constants.Strings.DEATHS).tag(StatTypeFilter.deaths)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding(.horizontal)
                        .transition(.scale)
                        .onReceive(self.summaryVM.$statType) { type in
                            self.summaryVM.sortCountriesBasedOnFilter(statType: type)
                        }
                    }
                    
                    List(self.summaryVM.countriesSummary.filteredCountries(countryName: self.searchText), id: \.country) { country in
                        NavigationLink(destination: CountryDetailView(country: country)) {
                            CountryListItem(country: country, statType: self.summaryVM.statType)
                        }
                    }
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
