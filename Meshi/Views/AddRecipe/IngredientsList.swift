//
//  IngredientsList.swift
//  Meshi
//
//  Created by Fredy Sanchez on 07/04/24.
//

import SwiftUI

struct IngredientsList: View {
    @Environment(\.managedObjectContext) private var context
    @StateObject private var viewModel = IngredientListViewModel()
    @State private var showIngredientPicker = false
    
    var body: some View {
        List {
            ForEach(viewModel.sortedIngredients, id: \.key) { ingredient, quantity in
                HStack {
                    Text(quantity)
                    Text(ingredient.name)
                }
                .listRowBackground(Color(.neutral100))
            }
            
            Button {
                showIngredientPicker = true
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
        .sheet(isPresented: $showIngredientPicker) {
            makeIngredientPicker()
        }
    }
    
    private func makeIngredientPicker() -> some View {
        let pickerViewModel = IngredientPickerViewModel(context: context)
        pickerViewModel.selectedIngredients = viewModel.selectedIngredients
        
        return IngredientPicker(viewModel: pickerViewModel) { ingredients in
            viewModel.addIngredients(ingredients)
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
