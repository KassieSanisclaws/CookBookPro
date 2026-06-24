//
//  CookBookProApp.swift
//  CookBookPro
//
//  Created by Kadeem Cherman on 2026-06-22.
//

import SwiftUI

@main
struct CookBookProApp: App {
    init () {
        FirebaseManager.shared
    }
    var body: some Scene {
        WindowGroup {
            SplashView()
        }
    }
}
