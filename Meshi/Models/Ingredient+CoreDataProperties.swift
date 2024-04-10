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
        let request = NSFetchRequest<Ingredient>(entityName: "Ingredient")
        request.sortDescriptors = []
        
        return request
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var recipeIngredients: NSSet?
    
    var unwrappedName: String {
        name ?? "Unnamed Ingredient"
    }
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

extension Ingredient {
    static func example(name: String, context: NSManagedObjectContext) -> Ingredient {
        let ingredient = Ingredient(context: context)
        ingredient.id = UUID()
        ingredient.name = name
        
        return ingredient
    }
}
