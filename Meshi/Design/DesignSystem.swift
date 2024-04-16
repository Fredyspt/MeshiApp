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
        private static let baseSize: CGFloat = 16
        
        static let largeTitle = Font.system(
            .largeTitle,
            design: .rounded,
            weight: .bold
        )
        
        static let title = Font.system(
            size: baseSize * 2.5,
            weight: .semibold,
            design: .rounded
        )
        
        static let title2 = Font.system(
            size: baseSize * 2.0,
            weight: .medium,
            design: .rounded
        )
        
        static let title3 = Font.system(
            size: baseSize * 1.5,
            weight: .regular,
            design: .rounded
        )
        
        static let normal = Font.system(
            size: baseSize,
            weight: .light,
            design: .rounded
        )
    }
}
