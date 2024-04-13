//
//  IngredientListViewModel.swift
//  Meshi
//
//  Created by Fredy Sanchez on 07/04/24.
//

import Foundation
import CoreData

class IngredientListViewModel: ObservableObject {
    @Published var selectedIngredients: [RecipeIngredient] = []
    @Published var showIngredientPicker = false
    
    private var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext = PersistenceController.shared.container.viewContext) {
        self.context = context
    }
    
//    func addIngredients(_ ingredients: Set<Ingredient>) {
//        selectedIngredients.removeAll()
//        
//        var tempArray = [RecipeIngredient]()
//        for ingredient in ingredients {
//            // Is there a more performant way of doing this? batch insert?
//            // what about if the recipe is discarded?
//            let recipeIngredient = RecipeIngredient(context: context)
//            recipeIngredient.ingredient = ingredient
//            tempArray.append(recipeIngredient)
//        }
//        
//        selectedIngredients = tempArray
//    }
}
