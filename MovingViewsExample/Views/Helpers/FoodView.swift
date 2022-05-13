//
//  FoodView.swift
//  MovingViewsExample
//
//  Created by Russell Gordon on 2022-05-08.
//

import SwiftUI

struct FoodView: View {
    
    // MARK: Stored properties
    
    // What food item to show
    let foodImageName: String
    
    // How long to delay in seconds before starting to move
    let delayTimeInSeconds: Int
    
    // Timer will fire once every second
    @State var timer = Timer.publish(every: 1.0, on: .main, in: .common)
    
    // Starting vertical offset for the image
    @State var yOffset = Double.random(in: -900...(-200))
    
    // Start horizontal offset for the image (random)
    @State var xOffset = Double.random(in: -200...200)
    
    // Is this animation active?
    @Binding var isActive: Bool

    // MARK: Computed properties
    var body: some View {
        
        Image(foodImageName)
            .resizable()
            .frame(width: 75, height: 75)
            // Controls position of the view
            .offset(x: xOffset, y: yOffset)
            // Receives the timer when it fires
            .onReceive(timer) { input in
                
                withAnimation(
                    Animation
                        .linear(duration: 1.0)
                ) {
                    if isActive == true {
                        yOffset += 15.0
                    }
                }
                
            }
            .onTapGesture {
                print("\(foodImageName) was tapped.")
                
            }
            // Runs once when the view is loaded
            .task {
                
                // This makes the timer begin firing on it's once per second schedule,
                // but only after a delay as specifed by the "delayTimeInSeconds" property
                Task {
                    
                    // Wait a bit...
                    try? await Task.sleep(nanoseconds: UInt64(delayTimeInSeconds) * 1_000_000_000)

                    // Start the timer
                    print("DEBUG: Now starting timer")
                    _ = timer.connect()
                }
                
                
            }
    }
}

struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView(foodImageName: "eggplant",
                 delayTimeInSeconds: 1, isActive: Binding.constant(false))
                    .previewInterfaceOrientation(.landscapeLeft)
    }
}
