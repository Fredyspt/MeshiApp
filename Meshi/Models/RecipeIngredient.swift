//
//  RecipeIngredient.swift
//  Meshi
//
//  Created by Fredy Sanchez on 01/04/24.
//
//

import Foundation
import CoreData

@objc(RecipeIngredient)
public class RecipeIngredient: NSManagedObject, Identifiable {
    @NSManaged public var amount: String?
    @NSManaged public var ingredient: Ingredient
    @NSManaged public var recipe: Recipe
    
    var ingredientName: String {
        ingredient.unwrappedName
    }
}

extension RecipeIngredient {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<RecipeIngredient> {
        return NSFetchRequest<RecipeIngredient>(entityName: "RecipeIngredient")
    }
}
