//
//  NewRecipeView.swift
//  Meshi
//
//  Created by Fredy Sanchez on 24/03/24.
//

import SwiftUI

struct NewRecipeView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var recipeName: String = ""
    @State private var preparation: String = ""
    
    // photo
    // name
    // ingredients
    // time
    // preparations
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Button {
                    print("tapped")
                } label: {
                    RecipeImage()
                }
                
                TextField("Recipe Name", text: $recipeName)
                    .multilineTextAlignment(.leading)
                    .font(.Meshi.title)
                    .padding(.vertical, 10)
                
                Text("Ingredients")
                    .font(.Meshi.title3)
                
                IngredientsList()
                
                Text("Preparation")
                    .font(.Meshi.title3)
                
                TextEditor(text: $preparation)
                    .font(.Meshi.normal)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    NewRecipeView()
}
