//
//  IngredientsList.swift
//  Meshi
//
//  Created by Fredy Sanchez on 07/04/24.
//

import SwiftUI

struct IngredientsList: View {
    @ObservedObject var viewModel: NewRecipeViewModel
    
    @Environment(\.managedObjectContext) private var context
    @State private var showIngredientPicker = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            ForEach(viewModel.sortedIngredients, id: \.key) { ingredient, amount in
                HStack {
                    SelfContainedTextField(initialValue: amount) { newAmount in
                        viewModel.updateAmount(for: ingredient, to: newAmount)
                    }
                    .frame(maxWidth: 100, minHeight: 30)
                    .multilineTextAlignment(.center)
                    
                    Text(ingredient.name)
                        .font(.Meshi.normal)
                        .foregroundStyle(.neutral1000)
                }
                .background(Color(.neutral100))
                
                Divider()
            }
            
            Button {
                showIngredientPicker = true
            } label: {
                HStack {
                    Image(systemName: "plus")
                    Text("Add Ingredients")
                        .font(.Meshi.normal)
                }
                .foregroundStyle(.neutral1000)
            }
            .background(Color(.neutral100))
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .topLeading
        )
        .padding(.vertical)
        .background(Color(.neutral100))
        .sheet(isPresented: $showIngredientPicker) {
            makeIngredientPicker()
        }
    }
    
    //MARK: - Subviews
    private func makeIngredientPicker() -> some View {
        let pickerViewModel = IngredientPickerViewModel(context: context)
        pickerViewModel.selectedIngredients = viewModel.selectedIngredients
        
        return IngredientPicker(viewModel: pickerViewModel) { ingredients in
            viewModel.addIngredients(ingredients)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let viewModel = NewRecipeViewModel(persistenceController: PersistenceController.preview)
    
    return IngredientsList(viewModel: viewModel)
        .environment(
            \.managedObjectContext,
             PersistenceController.preview.container.viewContext
        )
}
