//
//  RecipeDetailsView.swift
//  Meshi
//
//  Created by Fredy Sanchez on 04/04/24.
//

import SwiftUI

struct RecipeDetailsView: View {
    let recipe: Recipe
    
    var body: some View {
        Text("Child view: \(recipe.unwrappedName)")
    }
}

#Preview {
    RecipeDetailsView(
        recipe: .example(
            name: "Eggsy",
            context: PersistenceController.preview.container.viewContext
        )
    )
}
