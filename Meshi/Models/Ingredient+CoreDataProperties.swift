//
//  Ingredient+CoreDataProperties.swift
//  Meshi
//
//  Created by Fredy Sanchez on 01/04/24.
//
//

import Foundation
import CoreData

extension Ingredient {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ingredient> {
        return NSFetchRequest<Ingredient>(entityName: "Ingredient")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var recipeIngredients: NSSet?
}

// MARK: Generated accessors for recipeIngredients
extension Ingredient {
    @objc(addRecipeIngredientsObject:)
    @NSManaged public func addToRecipeIngredients(_ value: RecipeIngredient)

    @objc(removeRecipeIngredientsObject:)
    @NSManaged public func removeFromRecipeIngredients(_ value: RecipeIngredient)

    @objc(addRecipeIngredients:)
    @NSManaged public func addToRecipeIngredients(_ values: NSSet)

    @objc(removeRecipeIngredients:)
    @NSManaged public func removeFromRecipeIngredients(_ values: NSSet)
}

extension Ingredient : Identifiable { }
