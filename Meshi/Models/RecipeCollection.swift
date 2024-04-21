//
//  RecipeCollection.swift
//  Meshi
//
//  Created by Fredy Sanchez on 01/04/24.
//
//

import Foundation
import CoreData

@objc(RecipeCollection)
public class RecipeCollection: NSManagedObject, Identifiable {
    @NSManaged public var id: UUID
    @NSManaged public var name: String
    @NSManaged public var userDescription: String?
    @NSManaged public var recipes: Set<Recipe>
}

extension RecipeCollection {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<RecipeCollection> {
        return NSFetchRequest<RecipeCollection>(entityName: "RecipeCollection")
    }
}
