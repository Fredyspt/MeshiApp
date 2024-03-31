//
//  Collection+CoreDataProperties.swift
//  Meshi
//
//  Created by Fredy Sanchez on 30/03/24.
//
//

import Foundation
import CoreData


extension Collection {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Collection> {
        return NSFetchRequest<Collection>(entityName: "Collection")
    }

    @NSManaged public var id: UUID
    @NSManaged public var name: String
    @NSManaged public var userDescription: String?
    @NSManaged public var meals: NSSet?

}

// MARK: Generated accessors for meals
extension Collection {

    @objc(addMealsObject:)
    @NSManaged public func addToMeals(_ value: Meal)

    @objc(removeMealsObject:)
    @NSManaged public func removeFromMeals(_ value: Meal)

    @objc(addMeals:)
    @NSManaged public func addToMeals(_ values: NSSet)

    @objc(removeMeals:)
    @NSManaged public func removeFromMeals(_ values: NSSet)

}

extension Collection : Identifiable {

}
