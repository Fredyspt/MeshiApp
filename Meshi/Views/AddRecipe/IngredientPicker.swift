//
//  IngredientPicker.swift
//  Meshi
//
//  Created by Fredy Sanchez on 07/04/24.
//

import SwiftUI

struct IngredientPicker: View {
    @Environment(\.managedObjectContext) private var context
    @StateObject private var viewModel = IngredientPickerViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.ingredients) { ingredient in
                    IngredientRow(ingredient: ingredient)
                        .onTapGesture {
                            viewModel.toggleSelected(ingredient: ingredient)
                        }
                        .swipeActions(edge: .trailing) {
                            Button(role: .destructive) {
                                viewModel.delete(ingredient, inContext: context)
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
        .onAppear {
            viewModel.fetch(inContext: context)
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
                    viewModel.saveNewIngredient(inContext: context)
                }
            }
    }
}

#Preview {
    IngredientPicker()
        .environment(
            \.managedObjectContext,
             PersistenceController.preview.container.viewContext
        )
}
