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
            
            ForEach(categories) { category in
                
                ZStack {
                    Rectangle()
                        .frame(width: 50, height: 50)
                    if category.isChecked {
                        
                        Image(systemName:"checkmark")
                            .resizable()
                            .frame(width: 40, height: 40)
                        
                    }
                    
                }
                Text(category.name)
                    .font(.title2)
            }
            
        }
        
        
    }
}

struct TaskBarView_Previews: PreviewProvider {
    static var previews: some View {
        TaskBarView()
    }
}
