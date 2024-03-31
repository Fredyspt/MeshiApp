//
//  MealTimeSectionView.swift
//  Meshi
//
//  Created by Fredy Sanchez on 27/03/24.
//

import SwiftUI

struct MealTimeSectionView: View {
    let mealTime: MealTime
    let meals: [Meal]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(mealTime.rawValue)
                .font(.Meshi.title2)
            
            ForEach(meals) { meal in
                MealView(title: meal.name)
                    .padding(.bottom, 16)
            }
        }
    }
}

//#Preview {
//    MealTimeSectionView(
//        mealTime: .breakfast,
//        meals: [.init(name: "Eggs")]
//    )
//}
