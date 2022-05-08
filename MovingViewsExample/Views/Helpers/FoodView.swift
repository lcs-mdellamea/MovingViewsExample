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
    
    // Timer will fire once every second
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    // Starting vertical offset for the image
    @State var yOffset = -200.0
    
    // Start horizontal offset for the image (random)
    @State var xOffset = Double.random(in: -200...200)

    // MARK: Computed properties
    var body: some View {
        
        Image(foodImageName)
            .resizable()
            .frame(width: 75, height: 75)
            .offset(x: xOffset, y: yOffset)
            .onReceive(timer) { input in
                
                withAnimation(
                    Animation
                        .linear(duration: 1.0)
                ) {
                    yOffset += 15.0
                }
                
            }
            .onTapGesture {
                print("\(foodImageName) was tapped.")
            }
    }
}

struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView(foodImageName: "eggplant")
    }
}
