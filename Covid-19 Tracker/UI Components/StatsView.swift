//
//  StatsView.swift
//  Covid-19 Tracker
//
//  Created by Nicholas Arduini on 2020-06-16.
//  Copyright © 2020 Nicholas Arduini. All rights reserved.
//

import SwiftUI

struct StatsView: View {
    
    let globalStats : GlobalStats
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            VStack {
                HStack {
                    Text(Constants.Strings.CONFIRMED)
                        .foregroundColor(.systemYellow)
                        .font(.footnote).fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .padding(.leading)
                    Spacer()
                }
                HStack {
                    Text("\(globalStats.totalConfirmed)")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .padding(.leading)
                    Text(globalStats.newConfirmed.toPlusMinusString())
                        .foregroundColor(.secondaryLabel)
                        .font(.body)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
            }
            VStack {
                Spacer()
                HStack(alignment: .center, spacing: 4) {
                    Spacer()
                    SingleStat(title: Constants.Strings.ACTIVE, stat: globalStats.totalActive, change: globalStats.newActive, color: .systemOrange)
                    Spacer()
                    SingleStat(title: Constants.Strings.RECOVERED, stat: globalStats.totalRecovered, change: globalStats.newRecovered, color: .systemGreen)
                    Spacer()
                    SingleStat(title: Constants.Strings.DEATHS, stat: globalStats.totalDeaths, change: globalStats.newDeaths, color: .systemRed)
                    Spacer()
                }
                Spacer()
                StatsBarLineView(globalStats: globalStats, height: 5)
            }
            .frame(width: nil, height: 80, alignment: .center)
            .background(Color.systemBackground)
            .cornerRadius(12)
            .padding(.horizontal)
            .padding(.top)
        }
        .frame(width: nil, height: 200, alignment: .center)
        .background(Color.secondarySystemBackground)
        .cornerRadius(12)
        .padding(.horizontal)
    }
}

struct SingleStat: View {
    
    let title : String
    let stat: Int
    let change: Int
    let color: Color
    
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            Text(title)
                .foregroundColor(color)
                .font(.caption)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Text("\(stat)")
                .font(.headline)
                .fontWeight(.bold)
                .minimumScaleFactor(0.01)
                .lineLimit(1)
            Text(change.toPlusMinusString())
                .foregroundColor(.secondaryLabel)
                .font(.caption)
                .fontWeight(.bold)
        }
    }
}
