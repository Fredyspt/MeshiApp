//
//  RecipeView.swift
//  Meshi
//
//  Created by Fredy Sanchez on 26/03/24.
//

import Foundation
import SwiftUI

struct RecipeView: View {
    let title: String
    let image: UIImage? = nil
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.Meshi.title3)
            
            Text("This is a description")
                .font(.Meshi.normal)
            
            if let image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else {
                ZStack {
                    Color(.gray)
                    Image(systemName: "photo.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 80)
                        .foregroundStyle(.white)
                }
                .clipShape(.rect(cornerRadius: 15))
            }
        }
        .frame(height: 200)
    }
}

#Preview {
    RecipeView(title: "Recipe Name")
}
