//
//  MealTimeSectionView.swift
//  Meshi
//
//  Created by Fredy Sanchez on 27/03/24.
//

import SwiftUI

struct MealTimeSectionView: View {
    let daytimePlan: DaytimePlan
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(daytimePlan.mealTime.rawValue)
                .font(.Meshi.title2)
            
            ForEach(daytimePlan.unwrappedRecipes) { recipe in
                RecipeView(title: recipe.unwrappedName)
                    .padding(.bottom, 16)
            }
        }
    }
}

#Preview("MealTimeSectionView", traits: .sizeThatFitsLayout) {
    let previewContainer = PersistenceController.preview.container
    let exampleDaytimePlan = DaytimePlan.example(context: previewContainer.viewContext)
    return MealTimeSectionView(daytimePlan: exampleDaytimePlan)
}
