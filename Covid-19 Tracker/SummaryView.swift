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
    
    init() {
    }
    
    var body: some View {
        LoadingView(isShowing: .constant(summaryViewModel.isLoading)) {
            ZStack {
                Color.secondarySystemBackground
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    HStack {
                        if self.isSearching {
                            HStack {
                                Image(systemName: Constants.Images.MAGNIFYING_GLASS)
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
                            HeaderView(title: Constants.Strings.COVID_19)
                        }
                        Spacer()
                        Image(systemName: self.isSearching ? Constants.Images.CHEVRON_RIGHT_CIRCLE_FILL : Constants.Images.MAGNIFYING_GLASS_CIRCLE_FILL)
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.secondaryLabel)
                            .padding(.trailing)
                            .onTapGesture{
                                withAnimation {
                                    self.isSearching.toggle()
                                }
                        }
                    }.padding(.vertical)
                    
                    if !self.isSearching {
                        StatsView(globalStats: self.summaryViewModel.countriesSummary.globalStats).transition(.scale)
                        Picker(selection: Binding<StatTypeFilter>(
                        get: {self.summaryViewModel.statType},
                        set: {self.summaryViewModel.statType = $0}), label: Text("")) {
                            Text(Constants.Strings.CONFIRMED).tag(StatTypeFilter.confirmed)
                            Text(Constants.Strings.ACTIVE).tag(StatTypeFilter.active)
                            Text(Constants.Strings.RECOVERED).tag(StatTypeFilter.recovered)
                            Text(Constants.Strings.DEATHS).tag(StatTypeFilter.deaths)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding(.horizontal)
                        .transition(.scale)
                        .onReceive(self.summaryViewModel.$statType) { type in
                            self.summaryViewModel.sortCountriesBasedOnFilter(statType: type)
                        }
                    }
                    
                    List(self.summaryViewModel.countriesSummary.filteredCountries(countryName: self.searchText), id: \.country) { country in
                        CountryListItem(country: country, statType: self.summaryViewModel.statType)
                    }
                    .background(Color.secondarySystemBackground)
                }
                .navigationBarTitle(Constants.Strings.COVID_19)
            }
        }
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView().environment(\.colorScheme, .dark)
    }
}
