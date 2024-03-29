//
//  DesignSystem.swift
//  Meshi
//
//  Created by Fredy Sanchez on 29/03/24.
//

import Foundation
import SwiftUI

extension Font {
    struct Meshi {
        static let largeTitle = Font.system(
            .largeTitle,
            design: .rounded,
            weight: .bold
        )
        
        static let title = Font.system(
            size: 26,
            weight: .semibold,
            design: .rounded
        )
        
        static let title2 = Font.system(
            size: 24,
            weight: .medium,
            design: .rounded
        )
        
        static let title3 = Font.system(
            size: 20,
            weight: .regular,
            design: .rounded
        )
        
        static let normal = Font.system(
            size: 16,
            weight: .light,
            design: .rounded
        )
    }
}
