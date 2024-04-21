//
//  DayPlan.swift
//  Meshi
//
//  Created by Fredy Sanchez on 01/04/24.
//
//

import Foundation
import CoreData

@objc(DayPlan)
public class DayPlan: NSManagedObject, Identifiable {
    /// The id of the day's meal plan
    @NSManaged public var id: UUID
    
    /// The date of the day's plan
    @NSManaged public var date: Date
    
    /// Meal plans for each meal part of the day: Breakfast, Lunch and Dinner.
    @NSManaged public var mealPlans: Set<MealPlan>
    
    /// Meal plans for each meal part of the day: Breakfast, Lunch and Dinner (unwrapped).
    var unwrappedMealPlans: [MealPlan] {
        return mealPlans.sorted {
            $0.order < $1.order
        }
    }
    
    /// Date for display formatted as "Weekday Day"
    var displayDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE d"
        
        return dateFormatter.string(from: date)
    }
}

extension DayPlan {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<DayPlan> {
        return NSFetchRequest<DayPlan>(entityName: "DayPlan")
    }
    
    /// Get today's day plan.
    static func todayFetchRequest() -> NSFetchRequest<DayPlan> {
        let request = DayPlan.fetchRequest()
        let today = Date()
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: today)
        let endOfDay = calendar.date(byAdding: .day, value: 1, to: startOfDay) ?? Date()
        
        request.sortDescriptors = []
        request.predicate = NSPredicate(
            format: "(date >= %@) AND (date < %@)",
            startOfDay as NSDate,
            endOfDay as NSDate
        )
        
        request.fetchBatchSize = 1
        
        return request
    }
}
