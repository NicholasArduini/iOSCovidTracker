//
//  LoadingView.swift
//  Covid-19 Tracker
//
//  Created by Nicholas Arduini on 2020-06-16.
//  Copyright © 2020 Nicholas Arduini. All rights reserved.
//

import SwiftUI

struct ContentLoadingView: View {
    
    @Binding var isLoading: Bool
    @Binding var errorMessage: String
    var tryAgainClicked: () -> ()
    
    var body: some View {
        ZStack(alignment: .center) {
            ZStack {
                Rectangle().frame(width: nil, height: nil, alignment: .center).edgesIgnoringSafeArea(.all).foregroundColor(.secondarySystemBackground)
                if (isLoading) {
                    ActivityIndicator()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.label)
                        .transition(.scale)
                } else if (!errorMessage.isEmpty){
                    VStack {
                        Text(errorMessage)
                            .font(.body)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.systemGray)
                            .padding()
                        Button(action: {
                            self.tryAgainClicked()
                        }) {
                            HStack {
                                Text(Constants.Strings.TRY_AGAIN)
                                    .fontWeight(.semibold)
                                    .font(.body)
                                    .padding(.horizontal, 40)
                                    .padding(.vertical)
                            }
                            .foregroundColor(.label)
                            .background(Color.systemGray5)
                            .cornerRadius(40)
                            .padding()
                        }
                    }
                    .transition(.scale)
                }
            }
            .opacity(self.isLoading || !self.errorMessage.isEmpty ? 1 : 0)
        }
        
    }
}

private struct ActivityIndicator: View {
    
    @State private var isAnimating: Bool = false
    
    var body: some View {
        GeometryReader { (geometry: GeometryProxy) in
            ForEach(0..<5) { index in
                Group {
                    Circle()
                        .frame(width: geometry.size.width / 5, height: geometry.size.height / 5)
                        .scaleEffect(!self.isAnimating ? 1 - CGFloat(index) / 5 : 0.2 + CGFloat(index) / 5)
                        .offset(y: geometry.size.width / 10 - geometry.size.height / 2)
                }.frame(width: geometry.size.width, height: geometry.size.height)
                    .rotationEffect(!self.isAnimating ? .degrees(0) : .degrees(360))
                    .animation(Animation
                        .timingCurve(0.5, 0.15 + Double(index) / 5, 0.25, 1, duration: 1.5)
                        .repeatForever(autoreverses: false))
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .onAppear {
            self.isAnimating = true
        }
    }
}
