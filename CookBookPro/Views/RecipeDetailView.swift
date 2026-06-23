//
//  RecipeDetailView.swift
//  CookBookPro
//
//  Created by Kadeem Cherman on 2026-06-22.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    @State private var showInstructions = false
    
    var body: some View {
        ScrollView {
            AsyncImage(url: URL(string: recipe.imageURL))
            { image in
                  image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(height: 250)
            
            VStack(alignment: .leading) {
                
                Text(recipe.title)
                    .font(.largeTitle)
                    
                Text("Prep Time: \(recipe.prepTime)")
                
                Text("Ingredients")
                    .font(.headline)
                
                ForEach(recipe.ingredients, id: \.self) {
                    Text("* \($0)")
                }
                Button("View Instructions") {
                    showInstructions = true
                }
            }
        }
        .sheet(isPresented: $showInstructions) {
            InstructionsModal(recipe: recipe)
        }
    }
}

#Preview {
    RecipeDetailView(recipe: .sampleRecipe)
}
