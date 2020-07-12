//
//  StatTypePicker.swift
//  Covid-19 Tracker
//
//  Created by Nicholas Arduini on 2020-07-12.
//  Copyright © 2020 Nicholas Arduini. All rights reserved.
//

import SwiftUI

struct StatTypePicker: View {

    @Binding var statType: StatTypeFilter
    let onChange: (StatTypeFilter) -> ()

    var body: some View {
        VStack {
            Picker(selection: $statType.onChange(statChanged), label: EmptyView()) {
                    Text(Constants.Strings.CONFIRMED).tag(StatTypeFilter.confirmed)
                    Text(Constants.Strings.ACTIVE).tag(StatTypeFilter.active)
                    Text(Constants.Strings.RECOVERED).tag(StatTypeFilter.recovered)
                    Text(Constants.Strings.DEATHS).tag(StatTypeFilter.deaths)
            }
            .pickerStyle(SegmentedPickerStyle())
        }
    }
    
    func statChanged(_ type: StatTypeFilter) {
        self.onChange(type)
    }
}
