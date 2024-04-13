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
    
    private var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext = PersistenceController.shared.container.viewContext) {
        self.context = context
    }
    
    /// Add selected ingredients for the recipe, with an initial quantity of 1.
    /// - Parameter ingredients: ingredients to add.
    func addIngredients(_ ingredients: Set<IngredientViewModel>) {
        recipeIngredients.removeAll()
        
        for ingredient in ingredients {
            recipeIngredients[ingredient] = "1"
        }
    }
}
