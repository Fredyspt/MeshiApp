//
//  Recipe.swift
//  Meshi
//
//  Created by Fredy Sanchez on 01/04/24.
//
//

import Foundation
import CoreData

@objc(Recipe)
public class Recipe: NSManagedObject, Identifiable {
    @NSManaged public var id: UUID
    @NSManaged public var imageData: Data?
    @NSManaged public var name: String
    @NSManaged public var preparation: String
    @NSManaged public var timeToCook: String?
    @NSManaged public var collections: Set<Collection>
    @NSManaged public var recipeIngredients: Set<RecipeIngredient>
    @NSManaged public var tags: Set<Tag>
    @NSManaged public var mealPlans: Set<MealPlan>
}

extension Recipe {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recipe> {
        let request = NSFetchRequest<Recipe>(entityName: "Recipe")
        request.sortDescriptors = []
        return request
    }
}

extension Recipe {
    static func example(name: String, context: NSManagedObjectContext) -> Recipe {
        let recipe = Recipe(context: context)
        recipe.id = UUID()
        recipe.name = name
        recipe.preparation = "No instructions"
        
        return recipe
    }
}
