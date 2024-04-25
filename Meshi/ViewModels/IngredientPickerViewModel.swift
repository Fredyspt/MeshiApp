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
    //MARK: - Public Properties
    /// Whether or not the new ingredient row is displayed.
    @Published var addNewIngredientRow = false
    
    /// Binding to the new ingredient row's text field.
    @Published var newIngredientName = ""
    
    /// Set of selected ingredients.
    @Published var selectedIngredients = Set<Ingredient>()
    
    //MARK: - Private Properties
    private let context: NSManagedObjectContext
    private let persistenceController: PersistenceController
    
    //MARK: - Init
    init(persistenceController: PersistenceController) {
        self.context = persistenceController.childViewContext()
        self.persistenceController = persistenceController
    }
    
    //MARK: - Public Methods
    /// Remove an ingredient from the persistent store.
    /// - Parameter ingredient: Ingredient to remove
    /// - Parameter context: Context to remove the ingredient from.
    func delete(_ ingredient: Ingredient) {
        selectedIngredients.remove(ingredient)
        
        if let ingredientCopy = persistenceController.copyForEditing(of: ingredient, in: context) {
            context.delete(ingredientCopy)
            persistenceController.save(context)
        }
    }
    
    /// Save new ingredient to the store.
    /// - Parameter context: Context to perform the operation in.
    func saveNewIngredient() {
        if newIngredientName.isEmpty { return }
        
        let ingredient = Ingredient(context: context)
        ingredient.id = UUID()
        ingredient.name = newIngredientName
        
        persistenceController.persist(ingredient)
        
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
