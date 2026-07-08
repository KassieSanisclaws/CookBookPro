//
//  RatingStars.swift
//  CookBookPro
//
//  Created by Kadeem Cherman on 2026-07-07.
//

import SwiftUI

struct RatingStars: View {
    @Binding var rating: Int
    
    var body: some View {
        HStack {
             ForEach(1...5, id: \.self) { index in
                 Image(systemName: index <= rating ? "star.fill" : "star")
                     .foregroundStyle(.yellow)
                     .onTapGesture { rating = index }
            }
        }
    }
}

#Preview {
    RatingStars(
        rating: .constant(4)
    )
}
