//
//  SummaryView.swift
//  Covid-19 Tracker
//
//  Created by Nicholas Arduini on 2020-06-14.
//  Copyright © 2020 Nicholas Arduini. All rights reserved.
//

import SwiftUI

struct SummaryView: View {
    
    @ObservedObject private var summaryViewModel = SummaryViewModel()
    
    @State var searchText = ""
    @State var statType = 0
    @State var isSearching = false
    
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
                                TextField(Constants.Strings.SEARCH_COUNTRIES, text: self.$searchText
                                ).frame(width: nil, height: 40, alignment: .center)
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
                        Picker(selection: self.$statType, label: Text("")) {
                            Text(Constants.Strings.CONFIRMED).tag(0)
                            Text(Constants.Strings.ACTIVE).tag(1)
                            Text(Constants.Strings.RECOVERED).tag(2)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding(.horizontal)
                        .transition(.scale)
                    }
                    
                    List(self.summaryViewModel.countriesSummary.filteredCountries(countryName: self.searchText), id: \.country) { country in
                        CountryListItem(country: country)
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
