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
                    Text(ingredient.ingredientName)
                }
                .listRowBackground(Color(.neutral100))
            }
            
            Button {
                viewModel.showIngredientPicker = true
            } label: {
                HStack {
                    Image(systemName: "plus")
                    Text("Add Ingredients")
                }
            }
            .listRowBackground(Color(.neutral100))
        }
        .listStyle(.plain)
        .background(Color(.neutral100))
        .sheet(isPresented: $viewModel.showIngredientPicker) {
            IngredientPicker { ingredients in
                viewModel.addIngredients(ingredients)
            }
        }
    }
}

#Preview {
    IngredientsList()
        .environment(
            \.managedObjectContext,
             PersistenceController.preview.container.viewContext
        )
}
