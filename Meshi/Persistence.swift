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
            Meal.example(mealName: "Eggs", context: context),
            Meal.example(mealName: "Mashed Potatoes", context: context)
        ]
        
        let breakfastPlan = DaytimePlan(context: context)
        breakfastPlan.id = UUID()
        breakfastPlan.dayTime = "Breakfast"
        breakfastPlan.addToMeals(NSSet(array: breakfastMeals))
        
        let lunchMeals = [
            Meal.example(mealName: "Chicken Fajitas", context: context),
            Meal.example(mealName: "Tacos", context: context)
        ]
        
        let lunchPlan = DaytimePlan(context: context)
        lunchPlan.id = UUID()
        lunchPlan.dayTime = "Lunch"
        lunchPlan.addToMeals(NSSet(array: lunchMeals))
        
        let dinnerMeals = [
            Meal.example(mealName: "Lasagne", context: context),
            Meal.example(mealName: "Caesar Salad", context: context)
        ]
        
        let dinnerPlan = DaytimePlan(context: context)
        dinnerPlan.id = UUID()
        dinnerPlan.dayTime = "Dinner"
        dinnerPlan.addToMeals(NSSet(array: dinnerMeals))
        
        let daytimePlans = [breakfastPlan, lunchPlan, dinnerPlan]
        
        let dayPlan = DayPlan(context: context)
        dayPlan.id = UUID()
        dayPlan.date = Date()
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
