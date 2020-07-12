//
//  Binding+Extension.swift
//  Covid-19 Tracker
//
//  Created by Nicholas Arduini on 2020-07-12.
//  Copyright © 2020 Nicholas Arduini. All rights reserved.
//

import SwiftUI

extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        return Binding(
            get: { self.wrappedValue },
            set: { selection in
                self.wrappedValue = selection
                handler(selection)
        })
    }
}
