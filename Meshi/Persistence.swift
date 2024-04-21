//
//  Persistence.swift
//  Meshi
//
//  Created by Fredy Sanchez on 30/03/24.
//

import Foundation
import CoreData

struct PersistenceController {
    /// Shared app container.
    static let shared = PersistenceController()
    
    /// In-Memory persistent container with mock data for SwiftUI Previews
    static var preview: PersistenceController = {
        let controller = PersistenceController(inMemory: true)
        let context = controller.container.viewContext
        
        let breakfastMeals = [
            Recipe.example(name: "Eggs", context: context),
            Recipe.example(name: "Mashed Potatoes", context: context)
        ]
        
        let breakfastPlan = MealPlan(context: context)
        breakfastPlan.id = UUID()
        breakfastPlan.meal = "Breakfast"
        breakfastPlan.recipes = Set(breakfastMeals)
        
        let lunchMeals = [
            Recipe.example(name: "Chicken Fajitas", context: context),
            Recipe.example(name: "Tacos", context: context)
        ]
        
        let lunchPlan = MealPlan(context: context)
        lunchPlan.id = UUID()
        lunchPlan.meal = "Lunch"
        lunchPlan.recipes = Set(lunchMeals)
        
        let dinnerMeals = [
            Recipe.example(name: "Lasagne", context: context),
            Recipe.example(name: "Caesar Salad", context: context)
        ]
        
        let dinnerPlan = MealPlan(context: context)
        dinnerPlan.id = UUID()
        dinnerPlan.meal = "Dinner"
        dinnerPlan.recipes = Set(dinnerMeals)
        
        let mealPlans = [breakfastPlan, lunchPlan, dinnerPlan]
        
        let dayPlan = DayPlan(context: context)
        dayPlan.id = UUID()
        let today = Date()
//        let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: today)!
        dayPlan.date = today
        dayPlan.addToMealPlans(NSSet(array: mealPlans))
        
        let ingredient1 = Ingredient(context: context)
        ingredient1.id = UUID()
        ingredient1.name = "Garlic"
        
        let ingredient2 = Ingredient(context: context)
        ingredient2.id = UUID()
        ingredient2.name = "Chicken"
        
        let ingredient3 = Ingredient(context: context)
        ingredient3.id = UUID()
        ingredient3.name = "Salt"
        
        do {
            try context.save()
        } catch {
            fatalError()
        }
        
        return controller
    }()
    
    /// In-Memory, empty persistent container for unit testing.
    static var testing: PersistenceController = {
       PersistenceController(inMemory: true)
    }()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Meshi")
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(filePath: "/dev/null")
        }
        
        container.loadPersistentStores { description, error in
            if error != nil {
                fatalError("ERROR: Failed to load persistent stores!")
            }
        }
    }
    
    
    /// Create a new context that is a child of the ViewContext.
    /// This context is useful when you need a scratchpad to
    /// edit a managed object in a view. It runs on the main queue
    /// so it safe to access from the main thread to provide real time
    /// updates in the UI.
    /// - Returns: managed context.
    func childViewContext() -> NSManagedObjectContext {
        let childContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        childContext.parent = container.viewContext
        
        return childContext
    }
    
    /// Create a new temporary instance of the object in the given context.
    /// - Parameter context: context to associate the object to.
    /// - Returns: The temporary instance.
    func newTemporaryInstance<T: NSManagedObject>(in context: NSManagedObjectContext) -> T {
        T(context: context)
    }
    
    /// Get a copy of the object accessible from the given context.
    /// - Parameters:
    ///   - object: Object to copy
    ///   - context: Context to associate the object to.
    /// - Returns: A copy of the object accessible from the given context.
    func copyForEditing<T: NSManagedObject>(of object: T, in context: NSManagedObjectContext) -> T? {
        return (try? context.existingObject(with: object.objectID)) as? T
    }
    
    /// Save the object to the persistent store.
    /// - Parameter object: Object to persist.
    func persist(_ object: NSManagedObject) {
        do {
            try object.managedObjectContext?.save()
            
            if let parent = object.managedObjectContext?.parent {
                try parent.save()
            }
        } catch {
            // TODO: Show alert
            print(error.localizedDescription)
        }
    }
    
    func save() {
        let context = container.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // TODO: Show error
            }
        }
    }
}
