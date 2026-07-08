//
//  SettingsView.swift
//  CookBookPro
//
//  Created by Kadeem Cherman on 2026-07-07.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var theme: ThemeManager
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Appearance") {
                    Toggle("Dark Mode", isOn: $theme.isDarkModeEnabled)
                }
            }
            .navigationTitle(Text("Settings"))
        }
    }
}

#Preview {
    SettingsView()
}
