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
        Image("apple")
            .resizable()
            .frame(width: 75, height: 75)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
