//
//  ContentView.swift
//  MovingViewsExample
//
//  Created by Russell Gordon on 2022-05-08.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Stored properties
    
    // MARK: Computed properties
    var body: some View {

        ZStack {
            // SEE: https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-views-in-a-loop-using-foreach
            ForEach(1...3, id: \.self) { currentValue in
                FoodView(foodImageName: "apple")
            }
            ForEach(1...3, id: \.self) { currentValue in
                FoodView(foodImageName: "eggplant")
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
