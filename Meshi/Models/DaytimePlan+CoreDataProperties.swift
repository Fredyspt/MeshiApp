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
    @NSManaged public var meals: NSSet?
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
    
    var unwrappedMeals: [Meal] {
        let set = meals as? Set<Meal> ?? []
        return Array(set)
    }
    
    static func example(context: NSManagedObjectContext) -> DaytimePlan {
        let daytimePlan = DaytimePlan(context: context)
        daytimePlan.id = UUID()
        daytimePlan.dayTime = "Breakfast"
        daytimePlan.meals = [
            Meal.example(mealName: "Eggs", context: context),
            Meal.example(mealName: "Mashed Potatoes", context: context)
        ]
        
        return daytimePlan
    }
}

// MARK: Generated accessors for meals
extension DaytimePlan {
    @objc(addMealsObject:)
    @NSManaged public func addToMeals(_ value: Meal)

    @objc(removeMealsObject:)
    @NSManaged public func removeFromMeals(_ value: Meal)

    @objc(addMeals:)
    @NSManaged public func addToMeals(_ values: NSSet)

    @objc(removeMeals:)
    @NSManaged public func removeFromMeals(_ values: NSSet)
}

extension DaytimePlan : Identifiable { }
