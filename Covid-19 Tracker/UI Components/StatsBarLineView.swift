//
//  StatsBarLineView.swift
//  Covid-19 Tracker
//
//  Created by Nicholas Arduini on 2020-07-12.
//  Copyright © 2020 Nicholas Arduini. All rights reserved.
//

import SwiftUI

struct StatsBarLineView: View {
    
    let globalStats : GlobalStats
    let height: CGFloat
    
    var body: some View {
        HStack {
            GeometryReader { (geometry) in
                HStack(spacing: 0) {
                    Rectangle()
                        .fill(Color.orange)
                        .frame(width: geometry.size.width * self.getStatPercentage(stat: self.globalStats.totalActive), height: self.height)
                    Rectangle()
                        .fill(Color.green)
                        .frame(width: geometry.size.width * self.getStatPercentage(stat: self.globalStats.totalRecovered), height: self.height)
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: geometry.size.width * self.getStatPercentage(stat: self.globalStats.totalDeaths), height: self.height)
                }
            }
        }
    }
    
    func getStatPercentage(stat: Int) -> CGFloat {
        if (globalStats.totalConfirmed <= 0 || stat <= 0) { return 0.0 }
        return (CGFloat(stat) / CGFloat(globalStats.totalConfirmed))
    }
}
