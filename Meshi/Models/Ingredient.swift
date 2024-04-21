//
//  Ingredient.swift
//  Meshi
//
//  Created by Fredy Sanchez on 01/04/24.
//
//

import Foundation
import CoreData

@objc(Ingredient)
public class Ingredient: NSManagedObject, Identifiable {
    @NSManaged public var id: UUID
    @NSManaged public var name: String
    @NSManaged public var recipeIngredients: Set<RecipeIngredient>
}

extension Ingredient {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ingredient> {
        let request = NSFetchRequest<Ingredient>(entityName: "Ingredient")
        request.sortDescriptors = []
        
        return request
    }
}

extension Ingredient {
    static func example(name: String, context: NSManagedObjectContext) -> Ingredient {
        let ingredient = Ingredient(context: context)
        ingredient.id = UUID()
        ingredient.name = name
        
        return ingredient
    }
}
