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

extension DaytimePlan : Identifiable {

}
