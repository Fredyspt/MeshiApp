//
//  NewRecipeView.swift
//  Meshi
//
//  Created by Fredy Sanchez on 24/03/24.
//

import SwiftUI

struct NewRecipeView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: NewRecipeViewModel
    
    init(persistenceController: PersistenceController) {
        _viewModel = StateObject(wrappedValue: {
            NewRecipeViewModel(persistenceController: persistenceController)
        }())
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Button {
                        print("tapped")
                    } label: {
                        RecipeImage()
                    }
                    
                    TextField("Recipe Name", text: $viewModel.recipeName)
                        .multilineTextAlignment(.leading)
                        .font(.Meshi.title2)
                        .padding(.vertical, 10)
                    
                    Text("Ingredients")
                        .font(.Meshi.title3)
                    
                    IngredientsList()
                    
                    Text("Preparation")
                        .font(.Meshi.title3)
                    
                    TextEditor(text: $viewModel.preparation)
                        .font(.Meshi.normal)
                }
                .padding(.horizontal)
            }
            .background(Color(.neutral100))
            .navigationTitle("New Recipe")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
            }            
        }
    }
}

#Preview {
    let persistenceController = PersistenceController.preview
    
    return NewRecipeView(persistenceController: persistenceController)
        .environment(
            \.managedObjectContext,
             persistenceController.container.viewContext
        )
}
