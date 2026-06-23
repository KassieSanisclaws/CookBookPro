//
//  RecipeCard.swift
//  CookBookPro
//
//  Created by Kadeem Cherman on 2026-06-22.
//

import SwiftUI

struct RecipeCard: View {
    let recipe: Recipe
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: recipe.imageURL)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                 ProgressView()
            }
            .frame(height: 180)
            .frame(maxWidth: .infinity)
            .clipped()
            
             Text(recipe.title)
                .font(.headline)
        }
        .background(Color.mint)
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}

#Preview {
    RecipeCard(recipe: .sampleRecipe)
}
