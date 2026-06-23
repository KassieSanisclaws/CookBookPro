//
//  MainTabView.swift
//  CookBookPro
//
//  Created by Kadeem Cherman on 2026-06-22.
//

import SwiftUI

struct MainTabView: View {
    
    var body: some View {
        TabView {
            RecipeListView()
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("Recipes")
                }
            
            FavoritesView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favorites")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile") 
                }
        }
    }
}

#Preview {
    MainTabView()
}
