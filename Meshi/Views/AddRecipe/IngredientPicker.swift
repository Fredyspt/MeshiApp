//
//  IngredientPicker.swift
//  Meshi
//
//  Created by Fredy Sanchez on 07/04/24.
//

import SwiftUI

struct IngredientPicker: View {
    @ObservedObject var viewModel: IngredientPickerViewModel
    let onCommit: (Set<Ingredient>) -> Void
    
    @FetchRequest(fetchRequest: Ingredient.fetchRequest())
    private var ingredients: FetchedResults<Ingredient>

    var body: some View {
        VStack {
            List {
                ForEach(ingredients) { ingredient in
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
    let persistenceController = PersistenceController.preview
    let viewModel = IngredientPickerViewModel(persistenceController: persistenceController)
    
    return IngredientPicker(viewModel: viewModel, onCommit: { _ in })
        .environment(
            \.managedObjectContext,
             persistenceController.container.viewContext
        )
}
