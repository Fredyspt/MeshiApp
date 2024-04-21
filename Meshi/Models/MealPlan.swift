//
//  MealPlan.swift
//  Meshi
//
//  Created by Fredy Sanchez on 01/04/24.
//
//

import Foundation
import CoreData

@objc(MealPlan)
public class MealPlan: NSManagedObject, Identifiable {
    @NSManaged public var meal: String?
    @NSManaged public var id: UUID
    @NSManaged public var recipes: Set<Recipe>
    @NSManaged public var dayPlan: DayPlan?
    
    var unwrappedMeal: Meal {
        guard let meal else {
            return .otherMeals
        }
        
        return Meal(rawValue: meal) ?? .otherMeals
    }
    
    var order: UInt {
        switch meal {
        case "Breakfast": 0
        case "Lunch": 1
        case "Dinner": 2
        default: 3
        }
    }
}

extension MealPlan {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<MealPlan> {
        return NSFetchRequest<MealPlan>(entityName: "MealPlan")
    }
}

extension MealPlan {
    static func example(context: NSManagedObjectContext) -> MealPlan {
        let mealPlan = MealPlan(context: context)
        mealPlan.id = UUID()
        mealPlan.meal = "Breakfast"
        mealPlan.recipes = [
            Recipe.example(name: "Eggs", context: context),
            Recipe.example(name: "Mashed Potatoes", context: context)
        ]
        
        return mealPlan
    }
}
