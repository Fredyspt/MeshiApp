//
//  RecipeDetailsView.swift
//  Meshi
//
//  Created by Fredy Sanchez on 04/04/24.
//

import SwiftUI

struct RecipeDetailsView: View {
    let recipe: Meal
    
    var body: some View {
        Text("Child view: \(recipe.unwrappedName)")
    }
}

#Preview {
    RecipeDetailsView(
        recipe: .example(
            mealName: "Eggsy",
            context: PersistenceController.preview.container.viewContext
        )
    )
}
