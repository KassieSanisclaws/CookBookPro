//
//  FirebaseManager.swift
//  CookBookPro
//
//  Created by Kadeem Cherman on 2026-06-23.
//

import FirebaseCore

class FirebaseManager {
    static let shared = FirebaseManager()
    private init() {
        FirebaseApp.configure()
    }
}
