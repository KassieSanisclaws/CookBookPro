//
//  RecipeListView.swift
//  CookBookPro
//
//  Created by Kadeem Cherman on 2026-06-22.
//

import SwiftUI

struct RecipeListView: View {
    @StateObject private var vm = RecipeViewModel()
    
    var body: some View {
        
     NavigationStack {
            
            List {
                
                ForEach(vm.recipes) { recipe in
                    
                    Text(recipe.title)
                }
            }
            .navigationTitle("CookBook")
        }
     .task {
         vm.loadRecipes()
      }
    }
}

#Preview {
    RecipeListView()
}
