//
//  RecipeListView.swift
//  CookBookPro
//
//  Created by Kadeem Cherman on 2026-06-22.
//

import SwiftUI

struct RecipeListView: View {
    @StateObject private var vm = RecipeViewModel()
    @State private var searchText = ""
    @State private var selectedCategory = "All"
    
    var filteredRecipes: [Recipe] {
        var results = vm.recipes
        
        if !searchText.isEmpty {
            results = results.filter {
                $0.title.localizedCaseInsensitiveContains(searchText)
            }
        }
        if selectedCategory != "All" {
            results = results.filter {
                $0.category == selectedCategory
            }
        }
        return results
    }
    
    var body: some View {
        
     NavigationStack {
         VStack {
             Picker ("Category",  selection: $selectedCategory) {
                 Text("All").tag("All")
                 Text("Breakfast").tag("Breakfast")
                 Text("Lunch").tag("Lunch")
                 Text("Dinner").tag("Dinner")
             }
             .pickerStyle(.segmented)
         }
            List {
                
                ForEach(filteredRecipes) { recipe in
                    
                    Text(recipe.title)
                }
            }
            .navigationTitle("CookBook")
        }
     .searchable(text: $searchText, prompt: "seaarch Recipes")
     .task {
         vm.loadRecipes()
      }
    }
}

#Preview {
    RecipeListView()
}
