//
//  RecipeService.swift
//  CookBookPro
//
//  Created by Kadeem Cherman on 2026-06-23.
//

import FirebaseFirestore

class RecipeService {
    private let db = Firestore.firestore()
    
    func fetchRecipes(
        completion: @escaping ([Recipe]) -> Void
    ) {
        db.collection("recipes")
            .getDocuments {
                snapshot,error in
                guard let documents = snapshot?.documents else {
                    print(error?.localizedDescription ?? "")
                        completion([])
                    return
                }
                let recipes = documents.compactMap {
                    try? $0.data(as: Recipe.self)
                }
                completion(recipes)
            }
    }
}
