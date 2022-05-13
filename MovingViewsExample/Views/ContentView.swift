//
//  ContentView.swift
//  MovingViewsExample
//
//  Created by Russell Gordon on 2022-05-08.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Stored properties
    
    // Is game running?
    @State var isActive = true
    
    let categories = [Category(name: "Veggies", isChecked: false, quantityRemaining: 5), Category(name: "Carbs", isChecked: true, quantityRemaining: 3)]
    
    // MARK: Computed properties
    var body: some View {
        
        GeometryReader { geo in
            
            HStack {
                
                ZStack {
                    
                    // SEE: https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-views-in-a-loop-using-foreach
                    
                    ForEach(1...3, id: \.self) { currentValue in
                        FoodView(foodImageName: "apple",
                                 delayTimeInSeconds: currentValue * 3, isActive: $isActive)
                    }
                    
                    ForEach(1...3, id: \.self) { currentValue in
                        FoodView(foodImageName: "eggplant",
                                 delayTimeInSeconds: currentValue * 3, isActive: $isActive)
                    }
                    
                    ForEach(1...3, id: \.self) { currentValue in
                        FoodView(foodImageName: "carrot",
                                 delayTimeInSeconds: currentValue * 3, isActive: $isActive)
                    }
                    
                }
                .frame(width: geo.size.width * 0.8)
                
                TaskBarView(categories: categories)
                    .frame(width: geo.size.width * 0.3)
                
            }
        }
        
        //        .background(Image("landscape")
        //                        .resizable())
        //        .frame(width: 2100, height: 1100)
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
