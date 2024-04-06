//
//  RecipesView.swift
//  Meshi
//
//  Created by Fredy Sanchez on 24/03/24.
//

import SwiftUI

enum RecipesNavigation: Hashable {
    case recipeDetails(Recipe)
}

struct RecipesView: View {
    @Binding var path: [RecipesNavigation]
    
    @FetchRequest(fetchRequest: Recipe.fetchRequest())
    private var recipes: FetchedResults<Recipe>
    
    var body: some View {
        NavigationStack(path: $path) {
            List(recipes) { recipe in
                NavigationLink(value: RecipesNavigation.recipeDetails(recipe)) {
                    Text(recipe.unwrappedName)
                }
            }
            .navigationTitle("Recipes")
            .navigationDestination(for: RecipesNavigation.self) { route in
                switch route {
                case .recipeDetails(let recipe): RecipeDetailsView(recipe: recipe)
                }
            }
        }
    }
}

#Preview {
    RecipesView(path: .constant([RecipesNavigation]()))
        .environment(
            \.managedObjectContext,
             PersistenceController.preview.container.viewContext
        )
}
