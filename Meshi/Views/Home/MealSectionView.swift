//
//  MealSectionView.swift
//  Meshi
//
//  Created by Fredy Sanchez on 27/03/24.
//

import SwiftUI

struct MealSectionView: View {
    let mealPlan: MealPlan
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(mealPlan.unwrappedMeal.rawValue)
                .font(.Meshi.title2)
            
            ForEach(Array(mealPlan.recipes)) { recipe in
                RecipeView(title: recipe.unwrappedName)
                    .padding(.bottom, 16)
            }
        }
    }
}

#Preview("MealTimeSectionView", traits: .sizeThatFitsLayout) {
    let previewContainer = PersistenceController.preview.container
    let exampleMealPlan = MealPlan.example(context: previewContainer.viewContext)
    return MealSectionView(mealPlan: exampleMealPlan)
}
