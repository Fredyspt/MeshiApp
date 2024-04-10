//
//  IngredientListViewModel.swift
//  Meshi
//
//  Created by Fredy Sanchez on 07/04/24.
//

import Foundation

class IngredientListViewModel: ObservableObject {
    @Published var selectedIngredients: [RecipeIngredient] = []
    @Published var showIngredientPicker = false
}
