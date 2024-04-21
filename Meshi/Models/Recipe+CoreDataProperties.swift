//
//  Recipe+CoreDataProperties.swift
//  Meshi
//
//  Created by Fredy Sanchez on 01/04/24.
//
//

import Foundation
import CoreData

extension Recipe {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recipe> {
        let request = NSFetchRequest<Recipe>(entityName: "Recipe")
        request.sortDescriptors = []
        return request
    }

    @NSManaged public var id: UUID?
    @NSManaged public var imageData: Data?
    @NSManaged public var name: String?
    @NSManaged public var preparation: String?
    @NSManaged public var timeToCook: String?
    @NSManaged public var collections: NSSet?
    @NSManaged public var recipeIngredients: NSSet?
    @NSManaged public var tags: NSSet?
    @NSManaged public var mealPlans: NSSet?
    
    var unwrappedName: String {
        name ?? "Unnamed Recipe"
    }
    
    var ingredients: Set<RecipeIngredient> {
        recipeIngredients as? Set<RecipeIngredient> ?? []
    }
    
    static func example(name: String, context: NSManagedObjectContext) -> Recipe {
        let recipe = Recipe(context: context)
        recipe.id = UUID()
        recipe.name = name
        recipe.preparation = "No instructions"
        
        return recipe
    }
}

// MARK: Generated accessors for collections
extension Recipe {
    @objc(addCollectionsObject:)
    @NSManaged public func addToCollections(_ value: Collection)

    @objc(removeCollectionsObject:)
    @NSManaged public func removeFromCollections(_ value: Collection)

    @objc(addCollections:)
    @NSManaged public func addToCollections(_ values: NSSet)

    @objc(removeCollections:)
    @NSManaged public func removeFromCollections(_ values: NSSet)

}

// MARK: Generated accessors for recipeIngredients
extension Recipe {
    @objc(addRecipeIngredientsObject:)
    @NSManaged public func addToRecipeIngredients(_ value: RecipeIngredient)

    @objc(removeRecipeIngredientsObject:)
    @NSManaged public func removeFromRecipeIngredients(_ value: RecipeIngredient)

    @objc(addRecipeIngredients:)
    @NSManaged public func addToRecipeIngredients(_ values: NSSet)

    @objc(removeRecipeIngredients:)
    @NSManaged public func removeFromRecipeIngredients(_ values: NSSet)
}

// MARK: Generated accessors for tags
extension Recipe {
    @objc(addTagsObject:)
    @NSManaged public func addToTags(_ value: Tag)

    @objc(removeTagsObject:)
    @NSManaged public func removeFromTags(_ value: Tag)

    @objc(addTags:)
    @NSManaged public func addToTags(_ values: NSSet)

    @objc(removeTags:)
    @NSManaged public func removeFromTags(_ values: NSSet)

}

// MARK: Generated accessors for mealPlans
extension Recipe {
    @objc(addMealPlansObject:)
    @NSManaged public func addToMealPlans(_ value: MealPlan)

    @objc(removeMealPlansObject:)
    @NSManaged public func removeFromMealPlans(_ value: MealPlan)

    @objc(addMealPlans:)
    @NSManaged public func addToMealPlans(_ values: NSSet)

    @objc(removeMealPlans:)
    @NSManaged public func removeFromMealPlans(_ values: NSSet)
}

extension Recipe : Identifiable { }
