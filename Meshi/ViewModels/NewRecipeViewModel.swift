//
//  NewRecipeViewModel.swift
//  Meshi
//
//  Created by Fredy Sanchez on 18/04/24.
//

import Foundation
import CoreData

class NewRecipeViewModel: ObservableObject {
    //MARK: - Wrapped Properties
    @Published var recipeName = ""
    @Published var preparation = ""
    
    /// Dictionary that contains the ingredients-quantity pairs.
    @Published var recipeIngredients: [IngredientViewModel: String] = [:]
    
    //MARK: - Stored Properties
    private let recipe: Recipe
    private let context: NSManagedObjectContext
    private let persistenceController: PersistenceController
    
    //MARK: - Computed Properties
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
    
    //MARK: - Init
    init(persistenceController: PersistenceController) {
        context = persistenceController.childViewContext()
        recipe = persistenceController.newTemporaryInstance(in: context)
        
        self.persistenceController = persistenceController
    }
    
    //MARK: - Methods
    /// Add selected ingredients for the recipe, with an initial quantity of 1.
    /// - Parameter ingredients: ingredients to add.
    func addIngredients(_ ingredients: Set<IngredientViewModel>) {
        recipeIngredients.removeAll()
        
        for ingredient in ingredients {
            recipeIngredients[ingredient] = "1"
        }
    }
    
    // FIXME: Implement me!
    func updateAmount(for ingredient: IngredientViewModel, to newAmount: String) {
        
    }
}
