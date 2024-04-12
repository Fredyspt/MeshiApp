//
//  IngredientPickerViewModel.swift
//  Meshi
//
//  Created by Fredy Sanchez on 07/04/24.
//

import Foundation
import CoreData

// TODO: Add a repository/data source.
/// View Model for the `IngredientPicker` view. It is responsible of fetching
/// stored ingredients, selecting ingredients for new recipes, as well as adding new
/// ingredients to the persistent store.
class IngredientPickerViewModel: ObservableObject {
    /// Selected ingredients.
    @Published var selectedIngredients = Set<Ingredient>()
    
    /// Whether or not the new ingredient row is displayed.
    @Published var addNewIngredientRow = false
    
    /// Binding to the new ingredient row's text field.
    @Published var newIngredientName = ""
    
    /// Remove an ingredient from the persistent store.
    /// - Parameter ingredient: Ingredient to remove
    /// - Parameter context: Context to remove the ingredient from.
    func delete(_ ingredient: Ingredient, inContext context: NSManagedObjectContext) {
        selectedIngredients.remove(ingredient)
        context.delete(ingredient)
    }
    
    /// Save new ingredient to the store.
    /// - Parameter context: Context to perform the operation in.
    func saveNewIngredient(inContext context: NSManagedObjectContext) {
        if newIngredientName.isEmpty { return }
        
        let ingredient = Ingredient(context: context)
        ingredient.id = UUID()
        ingredient.name = newIngredientName
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
        
        addNewIngredientRow = false
        newIngredientName = ""
    }
    
    /// Toggle ingredient selection.
    /// - Parameter ingredient: ingredient to toggle selection.
    func toggleSelected(ingredient: Ingredient) {
        if isSelected(ingredient) {
            selectedIngredients.remove(ingredient)
        } else {
            selectedIngredients.insert(ingredient)
        }
    }
    
    func isSelected(_ ingredient: Ingredient) -> Bool {
        selectedIngredients.contains(ingredient)
    }
}
