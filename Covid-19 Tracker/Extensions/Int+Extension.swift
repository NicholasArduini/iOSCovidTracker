//
//  Int+Extension.swift
//  Covid-19 Tracker
//
//  Created by Nicholas Arduini on 2020-06-17.
//  Copyright © 2020 Nicholas Arduini. All rights reserved.
//

import Foundation

extension Int {

    func toPlusMinusString() -> String {
        var numberString = ""
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        if self > 0 {
            numberString = "+"
        }
        
        if self > 0 || self < 0 { numberString.append(numberFormatter.string(for: self) ?? "")
        }
        
        return numberString
    }
}
