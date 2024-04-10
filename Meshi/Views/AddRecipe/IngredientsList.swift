//
//  IngredientsList.swift
//  Meshi
//
//  Created by Fredy Sanchez on 07/04/24.
//

import SwiftUI

struct IngredientsList: View {
    @StateObject private var viewModel = IngredientListViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.selectedIngredients) { ingredient in
                HStack {
                    // Quantity
                    Text("Ingredient")
                }
            }
            
            Button {
                viewModel.showIngredientPicker = true
            } label: {
                HStack {
                    Image(systemName: "plus")
                    Text("Add Ingredients")
                }
            }
        }
        .listStyle(.plain)
        .sheet(isPresented: $viewModel.showIngredientPicker) {
            IngredientPicker()
        }
    }
}

#Preview {
    IngredientsList()
}
