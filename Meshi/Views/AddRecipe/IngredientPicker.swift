//
//  IngredientPicker.swift
//  Meshi
//
//  Created by Fredy Sanchez on 07/04/24.
//

import SwiftUI

struct IngredientPicker: View {
    @ObservedObject var viewModel: IngredientPickerViewModel
    
    let onCommit: (Set<IngredientViewModel>) -> Void

    var body: some View {
        VStack {
            List {
                ForEach(viewModel.ingredients) { ingredient in
                    IngredientRow(
                        ingredient: ingredient,
                        isSelected: viewModel.isSelected(ingredient)
                    )
                    .onTapGesture {
                        viewModel.toggleSelected(ingredient: ingredient)
                    }
                    .swipeActions(edge: .trailing) {
                        Button(role: .destructive) {
                            viewModel.delete(ingredient)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }
                
                if viewModel.addNewIngredientRow {
                    newIngredientRow
                }
            }
            .listStyle(.plain)
            
            Spacer()
            
            addIngredientButton
        }
        .background(Color(.neutral100))
        .onDisappear {
            onCommit(viewModel.selectedIngredients)
        }
    }
    
    private var addIngredientButton: some View {
        Button {
            viewModel.addNewIngredientRow = true
        } label: {
            Text("Add Ingredient")
                .font(.Meshi.normal.bold())
                .foregroundStyle(.neutral100)
                .padding()
                .background(Color.accentColor)
                .clipShape(.capsule)
        }
    }
    
    private var newIngredientRow: some View {
        TextField("New Ingredient", text: $viewModel.newIngredientName)
            .frame(height: 40)
            .font(.Meshi.normal)
            .foregroundStyle(.neutral1000)
            .listRowBackground(Color.neutral100)
            .onSubmit {
                withAnimation {
                    viewModel.saveNewIngredient()
                }
            }
    }
}

#Preview {
    let previewContainer = PersistenceController.preview.container
    let viewModel = IngredientPickerViewModel(context: previewContainer.viewContext)
    
    return IngredientPicker(viewModel: viewModel, onCommit: { _ in })
}
