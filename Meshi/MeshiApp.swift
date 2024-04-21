//
//  MeshiApp.swift
//  Meshi
//
//  Created by Fredy Sanchez on 24/03/24.
//

import SwiftUI

@main
struct MeshiApp: App {
    @Environment(\.scenePhase) var scenePhase
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environment(\.persistenceController, persistenceController)
        }
        .onChange(of: scenePhase) {
            persistenceController.save()
        }
    }
}
