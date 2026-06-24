//
//  RecipeViewModel.swift
//  CookBookPro
//
//  Created by Kadeem Cherman on 2026-06-23.
//

import Foundation
import Combine

@MainActor
class RecipeViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    
    private let recipeService =  RecipeService()
    
    func loadRecipes() {
        recipeService.fetchRecipes {
            recipes in
            self.recipes = recipes
        }
    }
}
