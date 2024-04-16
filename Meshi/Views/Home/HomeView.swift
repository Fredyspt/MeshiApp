//
//  HomeView.swift
//  Meshi
//
//  Created by Fredy Sanchez on 24/03/24.
//

import SwiftUI

struct HomeView: View {
    @FetchRequest(fetchRequest: DayPlan.todayFetchRequest())
    private var dayPlan: FetchedResults<DayPlan>
    
    var body: some View {
        if let dayPlan = dayPlan.first {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Text("My Meals")
                            .font(.Meshi.title)
                        
                        Spacer()
                    }
                    
                    Text(dayPlan.displayDate)
                        .font(.Meshi.title2)
                        .padding(.bottom, 16)
                    
                    ForEach(dayPlan.unwrappedMealPlans) { mealPlan in
                        MealSectionView(mealPlan: mealPlan)
                    }
                }
                .padding(.horizontal)
            }
        } else {
            Text("No meals!!")
        }
    }
}

#Preview {
    HomeView()
        .environment(
            \.managedObjectContext,
             PersistenceController.preview.container.viewContext
        )
}
