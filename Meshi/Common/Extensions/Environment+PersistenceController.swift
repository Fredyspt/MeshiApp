//
//  Environment+PersistenceController.swift
//  Meshi
//
//  Created by Fredy Sanchez on 20/04/24.
//

import Foundation
import SwiftUI

private struct PersistenceControllerKey: EnvironmentKey {
    static let defaultValue = PersistenceController.shared
}

extension EnvironmentValues {
    var persistenceController: PersistenceController {
        get { self[PersistenceControllerKey.self] }
        set { self[PersistenceControllerKey.self] = newValue }
    }
}
