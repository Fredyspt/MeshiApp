//
//  ContentView.swift
//  Meshi
//
//  Created by Fredy Sanchez on 24/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label("Home", systemImage: "house") }
            
            RecipesView()
                .tabItem { Label("Recipes", systemImage: "fork.knife") }
            
            NewMealView()
                .tabItem { Label("", systemImage: "plus.circle") }
            
            CalendarView()
                .tabItem { Label("Calendar", systemImage: "calendar") }
            
            SettingsView()
                .tabItem { Label("Settings", systemImage: "gear") }
        }
    }
}

#Preview {
    ContentView()
}
