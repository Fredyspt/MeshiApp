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
        
        let breakfastPlan = DaytimePlan(context: context)
        breakfastPlan.id = UUID()
        breakfastPlan.dayTime = "Breakfast"
        breakfastPlan.addToRecipes(NSSet(array: breakfastMeals))
        
        let lunchMeals = [
            Recipe.example(name: "Chicken Fajitas", context: context),
            Recipe.example(name: "Tacos", context: context)
        ]
        
        let lunchPlan = DaytimePlan(context: context)
        lunchPlan.id = UUID()
        lunchPlan.dayTime = "Lunch"
        lunchPlan.addToRecipes(NSSet(array: lunchMeals))
        
        let dinnerMeals = [
            Recipe.example(name: "Lasagne", context: context),
            Recipe.example(name: "Caesar Salad", context: context)
        ]
        
        let dinnerPlan = DaytimePlan(context: context)
        dinnerPlan.id = UUID()
        dinnerPlan.dayTime = "Dinner"
        dinnerPlan.addToRecipes(NSSet(array: dinnerMeals))
        
        let daytimePlans = [breakfastPlan, lunchPlan, dinnerPlan]
        
        let dayPlan = DayPlan(context: context)
        dayPlan.id = UUID()
        let today = Date()
//        let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: today)!
        dayPlan.date = today
        dayPlan.addToDaytimePlans(NSSet(array: daytimePlans))
        
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
