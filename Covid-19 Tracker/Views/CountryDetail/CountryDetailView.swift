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
    
    let country: Country
    
    var body: some View {
        VStack {
            HStack {
                IconButton(imageIconName: Constants.Icons.CHEVRON_LEFT, width: 10, height: 20, onTap: {
                    self.presentationMode.wrappedValue.dismiss()
                })
                    .padding(.leading).padding(.top)
                Spacer()
            }
            
            HStack {
                HeaderView(title: "\(country.countryCode.toFlagEmoji()) \(country.country)")
                Spacer()
            }
            
            StatsView(globalStats: country).padding(.top)
            Spacer()
        }
        .navigationBarHidden(true)
        .navigationBarTitle("")
    }
}
