//
//  RecipeImage.swift
//  Meshi
//
//  Created by Fredy Sanchez on 07/04/24.
//

import SwiftUI

struct RecipeImage: View {
    var body: some View {
        ZStack {
            Color(.gray)
            Image(systemName: "photo.fill")
                .resizable()
                .scaledToFit()
                .padding()
                .foregroundStyle(.white)
        }
        .frame(height: 160)
        .clipShape(.rect(cornerRadius: 15))
    }
}

#Preview {
    RecipeImage()
}
