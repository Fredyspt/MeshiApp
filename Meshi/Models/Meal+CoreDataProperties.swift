//
//  Meal+CoreDataProperties.swift
//  Meshi
//
//  Created by Fredy Sanchez on 01/04/24.
//
//

import Foundation
import CoreData

extension Meal {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Meal> {
        let request = NSFetchRequest<Meal>(entityName: "Meal")
        request.sortDescriptors = []
        return request
    }

    @NSManaged public var id: UUID?
    @NSManaged public var imageData: Data?
    @NSManaged public var name: String?
    @NSManaged public var preparation: String?
    @NSManaged public var timeToCook: String?
    @NSManaged public var collections: NSSet?
    @NSManaged public var mealIngredients: NSSet?
    @NSManaged public var tags: NSSet?
    @NSManaged public var daytimePlans: NSSet?
    
    var unwrappedName: String {
        name ?? "Unnamed Meal"
    }
    
    static func example(mealName: String, context: NSManagedObjectContext) -> Meal {
        let meal = Meal(context: context)
        meal.id = UUID()
        meal.name = mealName
        meal.preparation = "No instructions"
        
        return meal
    }
}

// MARK: Generated accessors for collections
extension Meal {
    @objc(addCollectionsObject:)
    @NSManaged public func addToCollections(_ value: Collection)

    @objc(removeCollectionsObject:)
    @NSManaged public func removeFromCollections(_ value: Collection)

    @objc(addCollections:)
    @NSManaged public func addToCollections(_ values: NSSet)

    @objc(removeCollections:)
    @NSManaged public func removeFromCollections(_ values: NSSet)

}

// MARK: Generated accessors for mealIngredients
extension Meal {
    @objc(addMealIngredientsObject:)
    @NSManaged public func addToMealIngredients(_ value: MealIngredient)

    @objc(removeMealIngredientsObject:)
    @NSManaged public func removeFromMealIngredients(_ value: MealIngredient)

    @objc(addMealIngredients:)
    @NSManaged public func addToMealIngredients(_ values: NSSet)

    @objc(removeMealIngredients:)
    @NSManaged public func removeFromMealIngredients(_ values: NSSet)
}

// MARK: Generated accessors for tags
extension Meal {
    @objc(addTagsObject:)
    @NSManaged public func addToTags(_ value: Tag)

    @objc(removeTagsObject:)
    @NSManaged public func removeFromTags(_ value: Tag)

    @objc(addTags:)
    @NSManaged public func addToTags(_ values: NSSet)

    @objc(removeTags:)
    @NSManaged public func removeFromTags(_ values: NSSet)

}

// MARK: Generated accessors for daytimePlans
extension Meal {
    @objc(addDaytimePlansObject:)
    @NSManaged public func addToDaytimePlans(_ value: DaytimePlan)

    @objc(removeDaytimePlansObject:)
    @NSManaged public func removeFromDaytimePlans(_ value: DaytimePlan)

    @objc(addDaytimePlans:)
    @NSManaged public func addToDaytimePlans(_ values: NSSet)

    @objc(removeDaytimePlans:)
    @NSManaged public func removeFromDaytimePlans(_ values: NSSet)
}

extension Meal : Identifiable { }
