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
    @nonobjc public class func fetchRequest() -> NSFetchRequest<DayPlan> {
        return NSFetchRequest<DayPlan>(entityName: "DayPlan")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var date: Date?
    @NSManaged public var daytimePlans: NSSet?
    
    var unwrappedDaytimePlans: [DaytimePlan] {
        let daytimePlansSet = daytimePlans as? Set<DaytimePlan> ?? []
        
        return daytimePlansSet.sorted {
            $0.order < $1.order
        }
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
