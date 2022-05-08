//
//  ContentView.swift
//  MovingViewsExample
//
//  Created by Russell Gordon on 2022-05-08.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Stored properties
    let appleTimer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    @State var appleOffset = -200.0
    
    // MARK: Computed properties
    var body: some View {
        
        Image("apple")
            .resizable()
            .frame(width: 75, height: 75)
            .offset(y: appleOffset)
            .onReceive(appleTimer) { input in
                
                withAnimation(
                    Animation
                        .linear(duration: 1.0)
                ) {
                    appleOffset += 15.0
                }
                
            }
            .onTapGesture {
                print("Apple was tapped.")
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
