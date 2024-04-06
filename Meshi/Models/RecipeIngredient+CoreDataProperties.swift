//
//  RecipeIngredient+CoreDataProperties.swift
//  Meshi
//
//  Created by Fredy Sanchez on 01/04/24.
//
//

import Foundation
import CoreData

extension RecipeIngredient {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<RecipeIngredient> {
        return NSFetchRequest<RecipeIngredient>(entityName: "RecipeIngredient")
    }

    @NSManaged public var quantity: Float
    @NSManaged public var unit: String?
    @NSManaged public var ingredient: Ingredient?
    @NSManaged public var recipe: Recipe?
}

extension RecipeIngredient : Identifiable { }
