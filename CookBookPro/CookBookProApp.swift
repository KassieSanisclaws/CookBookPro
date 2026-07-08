//
//  CookBookProApp.swift
//  CookBookPro
//
//  Created by Kadeem Cherman on 2026-06-22.
//

import SwiftUI

@main
struct CookBookProApp: App {
 @StateObject var themeManager = ThemeManager()
    
    init () {
        FirebaseManager.shared
    }
    
    var body: some Scene {
        WindowGroup {
            SplashView()
                .preferredColorScheme(
                      themeManager.isDarkModeEnabled ? .dark : .light
                )
                .environmentObject(themeManager)
        }
    }
}
