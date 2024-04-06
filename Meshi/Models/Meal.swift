//
//  Meal.swift
//  Meshi
//
//  Created by Fredy Sanchez on 27/03/24.
//

import Foundation

enum Meal: String, CaseIterable, Identifiable {
    case breakfast = "Breakfast"
    case lunch = "Lunch"
    case dinner = "Dinner"
    case otherMeals = "Other Meals"
    
    var id: Self {
        self
    }
}
