//
//  Ingredient+CoreDataProperties.swift
//  Meshi
//
//  Created by Fredy Sanchez on 30/03/24.
//
//

import Foundation
import CoreData


extension Ingredient {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ingredient> {
        return NSFetchRequest<Ingredient>(entityName: "Ingredient")
    }

    @NSManaged public var id: UUID
    @NSManaged public var name: String
    @NSManaged public var mealIngredients: NSSet?

}

// MARK: Generated accessors for mealIngredients
extension Ingredient {

    @objc(addMealIngredientsObject:)
    @NSManaged public func addToMealIngredients(_ value: MealIngredient)

    @objc(removeMealIngredientsObject:)
    @NSManaged public func removeFromMealIngredients(_ value: MealIngredient)

    @objc(addMealIngredients:)
    @NSManaged public func addToMealIngredients(_ values: NSSet)

    @objc(removeMealIngredients:)
    @NSManaged public func removeFromMealIngredients(_ values: NSSet)

}

extension Ingredient : Identifiable {

}
