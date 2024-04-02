//
//  MealIngredient+CoreDataProperties.swift
//  Meshi
//
//  Created by Fredy Sanchez on 01/04/24.
//
//

import Foundation
import CoreData


extension MealIngredient {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MealIngredient> {
        return NSFetchRequest<MealIngredient>(entityName: "MealIngredient")
    }

    @NSManaged public var quantity: Float
    @NSManaged public var unit: String?
    @NSManaged public var ingredient: Ingredient?
    @NSManaged public var meal: Meal?

}

extension MealIngredient : Identifiable {

}
