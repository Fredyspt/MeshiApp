//
//  SelfContainedTextField.swift
//  Meshi
//
//  Created by Fredy Sanchez on 15/04/24.
//

import SwiftUI

struct SelfContainedTextField: View {
    @State private var amount: String = ""
    
    let onCommit: (String) -> Void
    
    init(initialValue: String = "", onCommit: @escaping (String) -> Void) {
        amount = initialValue
        self.onCommit = onCommit
    }
    
    var body: some View {
        TextField("Amount", text: $amount) {
            onCommit(amount)
        }
        .font(.Meshi.normal)
        .foregroundStyle(.neutral1000)
    }
}

#Preview {
    SelfContainedTextField() { _ in }
}
