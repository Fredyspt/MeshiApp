//
//  HomeView.swift
//  Meshi
//
//  Created by Fredy Sanchez on 24/03/24.
//

import SwiftUI

struct HomeView: View {
    var today: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE dd"
        
        let today = Date()
        return dateFormatter.string(from: today)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Text("My Meals")
                        .bold()
                        .font(.largeTitle)
                    
                    Spacer()
                }
                
                Text(today)
                    .font(.title2)
                    .padding(.bottom, 16)
                
                ForEach(MealTime.allCases) { mealTime in
                    MealTimeSectionView(
                        mealTime: mealTime,
                        meals: [
                            .init(name: "Eggs")
                        ]
                    )
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    HomeView()
}
