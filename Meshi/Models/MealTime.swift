//
//  MealTime.swift
//  Meshi
//
//  Created by Fredy Sanchez on 27/03/24.
//

import Foundation

enum MealTime: String, CaseIterable, Identifiable {
    case breakfast = "Breakfast"
    case lunch = "Lunch"
    case dinner = "Dinner"
    
    var id: Self {
        self
    }
}
