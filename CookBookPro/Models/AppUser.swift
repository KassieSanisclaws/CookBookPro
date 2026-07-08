//
//  AppUser.swift
//  CookBookPro
//
//  Created by Kadeem Cherman on 2026-06-24.
//

import Foundation

struct AppUser: Codable, Identifiable {
    var id: String { uid }
    
    var uid: String
    var email: String
    var username: String
    var role: String
}
 
