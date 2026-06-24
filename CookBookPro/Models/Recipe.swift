//
//  Recipe.swift
//  CookBookPro
//
//  Created by Kadeem Cherman on 2026-06-22.
//

import Foundation
import FirebaseFirestore

struct Recipe: Identifiable, Codable {
    @DocumentID var id: String?
    var title: String
    var imageURL: String
    var category: String
    var ingredients: [String]
    var instructions: [String]
    var prepTime: String
    var isFavorite: Bool = false
}


extension Recipe {
    static let sampleRecipe = Recipe(
        id: "1",
        title: "Spaghetti Carbonara",
        imageURL: "https://picsum.photos/400",
        category: "Italian",
        ingredients: [
            "Spaghetti",
            "Eggs",
            "Parmesan",
            "Black pepper",
            "Tomatoes",
            "Basil",
            "Tomatoe sauce"
        ],
        instructions: [
            "Boil spaghetti",
            "Season with salt",
            "Beat eggs",
            "Mix ingredients",
            "Prepare sauce"
        ],
        prepTime: "30 mins"
    )
}
