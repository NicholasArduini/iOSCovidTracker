//
//  HeaderView.swift
//  Covid-19 Tracker
//
//  Created by Nicholas Arduini on 2020-06-16.
//  Copyright © 2020 Nicholas Arduini. All rights reserved.
//

import SwiftUI

struct HeaderView: View {
    
    var title : String
    
    var body: some View {
        Text(title)
            .font(.title)
            .fontWeight(.bold)
            .minimumScaleFactor(0.5)
            .multilineTextAlignment(.leading)
            .padding(.horizontal)
            .transition(.scale)
            .lineLimit(1)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: Constants.Strings.COVID_19_TITLE)
    }
}
