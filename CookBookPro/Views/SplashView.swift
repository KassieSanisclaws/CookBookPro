//
//  SplashView.swift
//  CookBookPro
//
//  Created by Kadeem Cherman on 2026-06-22.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive: Bool = false
    
    var body: some View {
        if isActive {
            MainTabView()
        } else {
            VStack {
                Image(systemName: "fork.knife")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                
                Text("CookBook Pro")
                    .font(.largeTitle)
                    .bold()
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
