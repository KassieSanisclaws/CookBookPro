//
//  ThemeManager.swift
//  CookBookPro
//
//  Created by Kadeem Cherman on 2026-07-07.
//

import SwiftUI
import Combine

class ThemeManager: ObservableObject {
    @AppStorage("isDarkModeEnabled") var isDarkModeEnabled: Bool = false
    
    func toggleTheme() {
        isDarkModeEnabled.toggle()
    }
}
