//
//  MealPlan+CoreDataProperties.swift
//  Meshi
//
//  Created by Fredy Sanchez on 01/04/24.
//
//

import Foundation
import CoreData

extension MealPlan {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<MealPlan> {
        return NSFetchRequest<MealPlan>(entityName: "MealPlan")
    }

    @NSManaged public var meal: String?
    @NSManaged public var id: UUID?
    @NSManaged public var recipes: NSSet?
    @NSManaged public var mealPlan: DayPlan?
    
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
    
    var unwrappedRecipes: [Recipe] {
        let set = recipes as? Set<Recipe> ?? []
        return Array(set)
    }
    
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

// MARK: Generated accessors for recipes
extension MealPlan {
    @objc(addRecipesObject:)
    @NSManaged public func addToRecipes(_ value: Recipe)

    @objc(removeRecipesObject:)
    @NSManaged public func removeFromRecipes(_ value: Recipe)

    @objc(addRecipes:)
    @NSManaged public func addToRecipes(_ values: NSSet)

    @objc(removeRecipes:)
    @NSManaged public func removeFromRecipes(_ values: NSSet)
}

extension MealPlan : Identifiable { }
