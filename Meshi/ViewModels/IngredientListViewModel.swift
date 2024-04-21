//
//  IngredientListViewModel.swift
//  Meshi
//
//  Created by Fredy Sanchez on 07/04/24.
//

import Foundation
import CoreData


/// View Model for IngredientsList section view in NewRecipeView
class IngredientListViewModel: ObservableObject {
    /// Dictionary that contains the ingredients-quantity pairs.
    @Published var recipeIngredients: [IngredientViewModel: String] = [:]
    // TODO: remove optional. Take context from persistenceController
    var context: NSManagedObjectContext?
    
    /// Array of ingredient-quantity pairs sorted alphabetically by the ingredient's name.
    var sortedIngredients: [(key: IngredientViewModel, value: String)] {
        recipeIngredients.sorted {
            $0.key.name > $1.key.name
        }
    }
    
    /// A set containing just the ingredients.
    var selectedIngredients: Set<IngredientViewModel> {
        Set(recipeIngredients.map(\.key))
    }
    
    /// Add selected ingredients for the recipe, with an initial quantity of 1.
    /// - Parameter ingredients: ingredients to add.
    func addIngredients(_ ingredients: Set<IngredientViewModel>) {
        recipeIngredients.removeAll()
        
        for ingredient in ingredients {
            recipeIngredients[ingredient] = "1"
        }
    }
    
    func updateAmount(for ingredient: IngredientViewModel, to newAmount: String) {
//        guard let ingredient = recipe.ingredients.first(where: { $0.ingredientName == ingredient.name}) else {
//            return
//        }
//        
//        ingredient.amount = newAmount
    }
}
