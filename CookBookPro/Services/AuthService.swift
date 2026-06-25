//
//  AuthService.swift
//  CookBookPro
//
//  Created by Kadeem Cherman on 2026-06-24.
//

import FirebaseAuth

class AuthService {
    static let shared = AuthService()
    
    func signUp (
        email: String,
        password: String,
        completion: @escaping (Error?) -> Void
    ) {
        Auth.auth().createUser(
                withEmail: email,
                password: password
        ) { _, error in
            completion(error)
        }
    }
    
    func signIn (
        email: String,
        password: String,
        completion: @escaping (Error?) -> Void
    ) {
        Auth.auth().signIn(
            withEmail: email,
            password: password
        ) { _, error in
            completion(error)
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut()
    }
       var currentUser: User? {
           Auth.auth().currentUser
    }
}


