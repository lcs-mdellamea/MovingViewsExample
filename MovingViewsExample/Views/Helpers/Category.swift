//
//  Category.swift
//  MovingViewsExample
//
//  Created by Madison Dellamea on 5/13/22.
//

import Foundation

struct Category: Identifiable {
    
    var id = UUID()
    var name: String
    var isChecked: Bool
    var quantityRemaining: Int {
        didSet {
            if quantityRemaining == 0 {
                isChecked = true
            } else {
                isChecked = false
            }
        }
    }
}
