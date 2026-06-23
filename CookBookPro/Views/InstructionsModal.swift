//
//  InstructionsModal.swift
//  CookBookPro
//
//  Created by Kadeem Cherman on 2026-06-22.
//

import SwiftUI

struct InstructionsModal: View {
    let recipe: Recipe
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(recipe.instructions.indices,
                id: \.self
                ) { index in
                    
                    Text("\(index + 1). \(recipe.instructions[index])")
                }
            }
            .navigationTitle("Instructions")
        }
    }
}

#Preview {
    InstructionsModal(recipe: .sampleRecipe)
}
