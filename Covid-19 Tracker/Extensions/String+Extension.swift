//
//  String+Extension.swift
//  Covid-19 Tracker
//
//  Created by Nicholas Arduini on 2020-06-16.
//  Copyright © 2020 Nicholas Arduini. All rights reserved.
//

import Foundation

extension String {

    func toFlagEmoji() -> String {
        let base : UInt32 = 127397
        var s = ""
        for v in self.unicodeScalars {
            s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return String(s)
    }
}
