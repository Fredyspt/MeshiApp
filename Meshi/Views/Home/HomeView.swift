//
//  HomeView.swift
//  Meshi
//
//  Created by Fredy Sanchez on 24/03/24.
//

import SwiftUI

struct HomeView: View {
    @FetchRequest(sortDescriptors: [])
    private var dayPlan: FetchedResults<DayPlan>
    
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
                        .font(.Meshi.largeTitle)
                    
                    Spacer()
                }
                
                Text(today)
                    .font(.Meshi.title)
                    .padding(.bottom, 16)
                
                if let dayPlan = dayPlan.first {
                    ForEach(dayPlan.unwrappedDaytimePlans) { daytimePlan in
                        MealTimeSectionView(daytimePlan: daytimePlan)
                    }
                } else {
                    Text("No meals today!")
                }
            }
            .padding(.horizontal)
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
