//
//  IconButton.swift
//  Covid-19 Tracker
//
//  Created by Nicholas Arduini on 2020-06-27.
//  Copyright © 2020 Nicholas Arduini. All rights reserved.
//

import SwiftUI

struct IconButton: View {
    
    let imageIconName: String
    var width : CGFloat = 30
    var height : CGFloat = 30
    let onTap: () -> ()
    
    
    var body: some View {
        VStack {
            Image(systemName: imageIconName)
                 .resizable()
                 .frame(width: width, height: height)
                 .foregroundColor(.label)
                 .onTapGesture{
                     withAnimation {
                         self.onTap()
                     }
             }
        }
    }
}

struct IconButton_Previews: PreviewProvider {
    static var previews: some View {
        IconButton(imageIconName: Constants.Icons.ARROW_CLOCKWISE_CIRCLE_FILL, onTap: {})
    }
}
