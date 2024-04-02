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
    @NSManaged public var daytimePlan: NSSet?

}

// MARK: Generated accessors for daytimePlan
extension DayPlan {

    @objc(addDaytimePlanObject:)
    @NSManaged public func addToDaytimePlan(_ value: DaytimePlan)

    @objc(removeDaytimePlanObject:)
    @NSManaged public func removeFromDaytimePlan(_ value: DaytimePlan)

    @objc(addDaytimePlan:)
    @NSManaged public func addToDaytimePlan(_ values: NSSet)

    @objc(removeDaytimePlan:)
    @NSManaged public func removeFromDaytimePlan(_ values: NSSet)

}

extension DayPlan : Identifiable {

}
