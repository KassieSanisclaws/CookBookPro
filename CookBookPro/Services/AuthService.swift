//
//  AuthService.swift
//  CookBookPro
//
//  Created by Kadeem Cherman on 2026-06-24.
//

import FirebaseAuth

class AuthService {
    static let shared = AuthService()
    
    private init() { }
    
 //Sign-Up Function
    func signUp (
        email: String,
        password: String,
        completion: @escaping (Result<User,Error>) -> Void
    ) {
        Auth.auth().createUser(
                withEmail: email,
                password: password
        ) { result, error in
            
        if let error = error {
            completion(.failure(error))
             return
            }
            guard let user = result?.user else {
                return
            }
            completion(.success(user))
        }
    }
    
 //SignIn Function:
    func signIn (
        email: String,
        password: String,
        completion: @escaping (Result<User, Error>) -> Void
    ) {
        
        Auth.auth().signIn(
            withEmail: email,
            password: password
        ) { result, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let user = result?.user else {
                return
            }
            
            completion(.success(user))
        }
    }
  
//SignOut Function:
    func signOut() {
        try? Auth.auth().signOut()
    }
       var currentUser: User? {
           Auth.auth().currentUser
    }
}


