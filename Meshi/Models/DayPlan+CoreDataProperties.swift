//
//  DayPlan+CoreDataProperties.swift
//  Meshi
//
//  Created by Fredy Sanchez on 01/04/24.
//
//

import Foundation
import CoreData

extension DayPlan {
    /// The id of the day's meal plan
    @NSManaged public var id: UUID?
    
    /// The date of the day's plan
    @NSManaged public var date: Date?
    
    /// Meal plans for each meal part of the day: Breakfast, Lunch and Dinner.
    @NSManaged public var daytimePlans: NSSet?
    
    /// Meal plans for each meal part of the day: Breakfast, Lunch and Dinner (unwrapped).
    var unwrappedDaytimePlans: [DaytimePlan] {
        let daytimePlansSet = daytimePlans as? Set<DaytimePlan> ?? []
        
        return daytimePlansSet.sorted {
            $0.order < $1.order
        }
    }
    /// The date of the day's plan (unwrapped)
    var unwrappedDate: Date {
        date ?? Date()
    }
    
    /// Date for display formatted as "Weekday Day"
    var displayDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE d"
        
        return dateFormatter.string(from: unwrappedDate)
    }
}

// MARK: Generated accessors for daytimePlans
extension DayPlan {
    @objc(addDaytimePlansObject:)
    @NSManaged public func addToDaytimePlans(_ value: DaytimePlan)

    @objc(removeDaytimePlansObject:)
    @NSManaged public func removeFromDaytimePlans(_ value: DaytimePlan)

    @objc(addDaytimePlans:)
    @NSManaged public func addToDaytimePlans(_ values: NSSet)

    @objc(removeDaytimePlans:)
    @NSManaged public func removeFromDaytimePlans(_ values: NSSet)
}

extension DayPlan : Identifiable { }

// MARK: Fetch Requests
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
