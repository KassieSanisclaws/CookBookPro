//
//  Ratings.swift
//  CookBookPro
//
//  Created by Kadeem Cherman on 2026-07-07.
//

import Foundation
import Combine

struct Ratings: Codable, Identifiable {
    var id: String = UUID().uuidString
    
    var userIdd: String
    var recipeId: String
    var value: Int
}
