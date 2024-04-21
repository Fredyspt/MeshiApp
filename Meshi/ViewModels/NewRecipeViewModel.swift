//
//  NewRecipeViewModel.swift
//  Meshi
//
//  Created by Fredy Sanchez on 18/04/24.
//

import Foundation
import CoreData

class NewRecipeViewModel: ObservableObject {
    @Published var recipeName = ""
    @Published var preparation = ""
    
    private let context: NSManagedObjectContext
    
    init(persistenceController: PersistenceController) {
        print("VM init")
        context = persistenceController.container.newBackgroundContext() // get new child context
        // TODO: create new entity in context
    }
    
    func createRecipe() {
        
    }
}
