//
//  IngredientPickerViewModel.swift
//  Meshi
//
//  Created by Fredy Sanchez on 07/04/24.
//

import Foundation
import CoreData

struct IngredientViewModel: Identifiable {
    let id: UUID
    let name: String
    var isSelected: Bool
    
    init(ingredient: Ingredient) {
        id = ingredient.id ?? UUID()
        name = ingredient.unwrappedName
        isSelected = false
    }
    
    init(id: UUID, name: String, isSelected: Bool) {
        self.id = id
        self.name = name
        self.isSelected = isSelected
    }
}

// TODO: Add a repository/data source.
/// View Model for the `IngredientPicker` view. It is responsible of fetching
/// stored ingredients, selecting ingredients for new recipes, as well as adding new
/// ingredients to the persistent store.
class IngredientPickerViewModel: ObservableObject {
    // Using @FetchRequest and Ingredients directly on
    // the view might remove some complexity here related
    // to maintaining both the store and this property in sync.
    /// Saved ingredients.
    @Published var ingredients = [IngredientViewModel]()
    
    /// Whether or not the new ingredient row is displayed.
    @Published var addNewIngredientRow = false
    
    /// Binding to the new ingredient row's text field.
    @Published var newIngredientName = ""
    
    /// Fetch stored ingredients.
    /// - Parameter context: context to fetch the ingredients in.
    func fetch(inContext context: NSManagedObjectContext) {
        let request = Ingredient.fetchRequest()
        
        let results = (try? context.fetch(request)) ?? []
        ingredients = results.map { IngredientViewModel(ingredient: $0) }
    }
    
    /// Remove an ingredient from the persistent store.
    /// - Parameter ingredient: Ingredient to remove
    /// - Parameter context: Context to remove the ingredient from.
    func delete(_ ingredient: IngredientViewModel, inContext context: NSManagedObjectContext) {
        let request = Ingredient.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", ingredient.id as CVarArg)
        request.fetchLimit = 1
        
        do {
            let results = try context.fetch(request)
            
            if let ingredient = results.first {
                context.delete(ingredient)
                ingredients.removeAll(where: { ingredient.id == $0.id })
            }
            
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
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
            ingredients.append(IngredientViewModel(ingredient: ingredient))
        } catch {
            print(error.localizedDescription)
        }
        
        addNewIngredientRow = false
        newIngredientName = ""
    }
    
    
    /// Toggle ingredient selection.
    /// - Parameter ingredient: ingredient to toggle selection.
    func toggleSelected(ingredient: IngredientViewModel) {
        guard let index = ingredients.firstIndex(where: { ingredient.id == $0.id }) else {
            return
        }
        
        ingredients[index].isSelected.toggle()
    }
}
