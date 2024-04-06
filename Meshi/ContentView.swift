//
//  ContentView.swift
//  Meshi
//
//  Created by Fredy Sanchez on 24/03/24.
//

import SwiftUI

enum Tab {
    case home
    case recipes
    case calendar
    case settings
}

struct ContentView: View {
    @State private var selectedTab: Tab = .home
    @State private var recipesNavigation: [RecipesNavigation] = []
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem { Label("Home", systemImage: "house") }
                .tag(Tab.home)
            
            RecipesView(path: $recipesNavigation)
                .tabItem { Label("Recipes", systemImage: "fork.knife") }
                .tag(Tab.recipes)
            
            CalendarView()
                .tabItem { Label("Calendar", systemImage: "calendar") }
                .tag(Tab.calendar)
            
            SettingsView()
                .tabItem { Label("Settings", systemImage: "gear") }
                .tag(Tab.settings)
        }
    }
}

#Preview {
    ContentView()
        .environment(
            \.managedObjectContext,
             PersistenceController.preview.container.viewContext
        )
}
