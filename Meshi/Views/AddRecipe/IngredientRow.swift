//
//  IngredientRow.swift
//  Meshi
//
//  Created by Fredy Sanchez on 08/04/24.
//

import SwiftUI

struct IngredientRow: View {    
    let ingredient: Ingredient
    let isSelected: Bool
    
    var body: some View {
        HStack {
            Text(ingredient.name)
                .font(.Meshi.normal)
                .foregroundStyle(Color(.neutral1000))
            
            
            Spacer()
            
            if isSelected {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 20)
                    .foregroundStyle(Color.accentColor)
            }
        }
        .frame(height: 40)
        .listRowBackground(Color(.neutral100))
        .contentShape(Rectangle())
        .clipped()
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let previewContext = PersistenceController.preview.container.viewContext
    let ingredient = Ingredient.example(
        name: "Garlic",
        context: previewContext
    )
    
    return IngredientRow(
        ingredient: ingredient,
        isSelected: true
    )
}
