//
//  Comments.swift
//  CookBookPro
//
//  Created by Kadeem Cherman on 2026-07-07.
//

import Foundation
import Combine
import FirebaseFirestore

struct Comments: Codable, Identifiable {
    @DocumentID var id: String?
    
    var userId: String
    var recipeId: String
    var text: String
    var timeStamp: Date
}
