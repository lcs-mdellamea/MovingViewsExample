//
//  TaskBarView.swift
//  MovingViewsExample
//
//  Created by Madison Dellamea on 5/13/22.
//

import SwiftUI

struct TaskBarView: View {
    
    @State var categories: [Category]
    
    var body: some View {
        
        VStack {
            
            List {
                
                ForEach(categories) { category in
                    
                    ZStack {
                        Image(systemName:"square")
                            .resizable()
                            .frame(width: 30, height: 30)
                        
                        if category.isChecked {
                            
                            Image(systemName:"checkmark")
                                .resizable()
                                .frame(width: 25, height: 25)
                            
                        }
                        
                    }
                    Text(category.name)
                        .font(.title2)
                }
                
            }
        }
        
        
    }
}

struct TaskBarView_Previews: PreviewProvider {
    static var previews: some View {
        TaskBarView(categories: [Category(name: "Veggies", isChecked: false, quantityRemaining: 5), Category(name: "Carbs", isChecked: false, quantityRemaining: 3)])
    }
}
