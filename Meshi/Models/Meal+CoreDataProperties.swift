//
//  Meal+CoreDataProperties.swift
//  Meshi
//
//  Created by Fredy Sanchez on 30/03/24.
//
//

import Foundation
import CoreData


extension Meal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Meal> {
        return NSFetchRequest<Meal>(entityName: "Meal")
    }

    @NSManaged public var id: UUID
    @NSManaged public var name: String
    @NSManaged public var preparation: String
    @NSManaged public var imageData: Data?
    @NSManaged public var timeToCook: String?
    @NSManaged public var tags: NSSet?
    @NSManaged public var mealIngredients: NSSet?
    @NSManaged public var collections: NSSet?

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

extension Meal : Identifiable {

}
