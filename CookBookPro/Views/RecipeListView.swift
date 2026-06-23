//
//  RecipeListView.swift
//  CookBookPro
//
//  Created by Kadeem Cherman on 2026-06-22.
//

import SwiftUI

struct RecipeListView: View {
    
    var body: some View {
        
     NavigationStack {
            
            List {
                Text("Recipes Coming Soon")
            }
            .navigationTitle("CookBook")
        }
    }
}

#Preview {
    RecipeListView()
}
