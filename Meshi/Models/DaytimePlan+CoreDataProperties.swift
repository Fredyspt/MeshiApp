//
//  DaytimePlan+CoreDataProperties.swift
//  Meshi
//
//  Created by Fredy Sanchez on 01/04/24.
//
//

import Foundation
import CoreData

extension DaytimePlan {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<DaytimePlan> {
        return NSFetchRequest<DaytimePlan>(entityName: "DaytimePlan")
    }

    @NSManaged public var dayTime: String?
    @NSManaged public var id: UUID?
    @NSManaged public var recipes: NSSet?
    @NSManaged public var mealPlan: DayPlan?
    
    var mealTime: MealTime {
        guard let dayTime else {
            return .otherMeals
        }
        
        return MealTime(rawValue: dayTime) ?? .otherMeals
    }
    
    var order: UInt {
        switch dayTime {
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
    
    static func example(context: NSManagedObjectContext) -> DaytimePlan {
        let daytimePlan = DaytimePlan(context: context)
        daytimePlan.id = UUID()
        daytimePlan.dayTime = "Breakfast"
        daytimePlan.recipes = [
            Recipe.example(name: "Eggs", context: context),
            Recipe.example(name: "Mashed Potatoes", context: context)
        ]
        
        return daytimePlan
    }
}

// MARK: Generated accessors for recipes
extension DaytimePlan {
    @objc(addRecipesObject:)
    @NSManaged public func addToRecipes(_ value: Recipe)

    @objc(removeRecipesObject:)
    @NSManaged public func removeFromRecipes(_ value: Recipe)

    @objc(addRecipes:)
    @NSManaged public func addToRecipes(_ values: NSSet)

    @objc(removeRecipes:)
    @NSManaged public func removeFromRecipes(_ values: NSSet)
}

extension DaytimePlan : Identifiable { }
