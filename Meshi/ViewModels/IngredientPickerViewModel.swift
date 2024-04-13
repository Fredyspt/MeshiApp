//
//  IngredientPickerViewModel.swift
//  Meshi
//
//  Created by Fredy Sanchez on 07/04/24.
//

import Foundation
import CoreData

struct IngredientViewModel: Identifiable, Hashable {
    let id: UUID
    let name: String
    
    init(ingredient: Ingredient) {
        self.id = ingredient.unwrappedId
        self.name = ingredient.unwrappedName
    }
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
    
    static func example() -> IngredientViewModel {
        IngredientViewModel(
            id: UUID(),
            name: "Some Ingredient"
        )
    }
}

// TODO: Add a repository/data source.
/// View Model for the `IngredientPicker` view. It is responsible of fetching
/// stored ingredients, selecting ingredients for new recipes, as well as adding new
/// ingredients to the persistent store.
class IngredientPickerViewModel: NSObject, ObservableObject {
    //MARK: - Public Properties
    /// Selected ingredients.
    @Published var ingredients = [IngredientViewModel]()
    
    /// Whether or not the new ingredient row is displayed.
    @Published var addNewIngredientRow = false
    
    /// Binding to the new ingredient row's text field.
    @Published var newIngredientName = ""
    
    @Published var selectedIngredients = Set<IngredientViewModel>()
    
    //MARK: - Private Properties
    private let context: NSManagedObjectContext
    private let fetchedResultsController: NSFetchedResultsController<Ingredient>
    
    //MARK: - Init
    init(context: NSManagedObjectContext) {
        self.context = context
        self.fetchedResultsController = NSFetchedResultsController(
            fetchRequest: Ingredient.fetchRequest(),
            managedObjectContext: context,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        
        super.init()
        
        fetchedResultsController.delegate = self
        fetch()
    }
    
    //MARK: - Public Methods
    /// Remove an ingredient from the persistent store.
    /// - Parameter ingredient: Ingredient to remove
    /// - Parameter context: Context to remove the ingredient from.
    func delete(_ ingredient: IngredientViewModel) {
        ingredients.removeAll(where: {$0.id == ingredient.id })
        selectedIngredients.remove(ingredient)
        
        let request = Ingredient.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", ingredient.id as CVarArg)
        
        do {
            let results = try context.fetch(request)
            
            if let hit = results.first {
                context.delete(hit)
            }
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    /// Save new ingredient to the store.
    /// - Parameter context: Context to perform the operation in.
    func saveNewIngredient() {
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
    func toggleSelected(ingredient: IngredientViewModel) {
        if isSelected(ingredient) {
            selectedIngredients.remove(ingredient)
        } else {
            selectedIngredients.insert(ingredient)
        }
    }
    
    func isSelected(_ ingredient: IngredientViewModel) -> Bool {
        selectedIngredients.contains(ingredient)
    }
    
    //MARK: - Private Methods
    private func fetch() {
        do {
            try fetchedResultsController.performFetch()
            
            guard let ingredients = fetchedResultsController.fetchedObjects else {
                return
            }
            
            self.ingredients = ingredients.map(IngredientViewModel.init)
        } catch {
            print(error.localizedDescription)
        }
    }
}

//MARK: - NSFetchedResultsControllerDelegate
extension IngredientPickerViewModel: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<any NSFetchRequestResult>) {
        guard let ingredients = controller.fetchedObjects as? [Ingredient] else { return }
        
        self.ingredients = ingredients.map(IngredientViewModel.init)
    }
}
