//
//  Auth ViewModel.swift
//  CookBookPro
//
//  Created by Kadeem Cherman on 2026-07-07.
//

import Foundation
import FirebaseAuth
import Combine

class AuthViewModel: ObservableObject {
    @Published var user: User?
    @Published var isLoggedIn: Bool = false
    
    init() {
        self.user = AuthService.shared.currentUser
        self.isLoggedIn = AuthService.shared.currentUser != nil
    }
    
 //SignIn Function
    func signIn(email: String, password: String) {
        AuthService.shared.signIn(
            email: email,
            password: password
        ) { result in
            
            DispatchQueue.main.async {
                
             switch result {
                case .success(let user):
                    self.user = user
                    self.isLoggedIn = true
                
             case .failure(let error):
                 print("Login Error:", error.localizedDescription)
                }
            }
        }
    }
    
// SignUp Function:
  func signUp(email: String, password: String) {
      AuthService.shared.signUp(
        email: email,
        password: password
        ) { result in
          
          DispatchQueue.main.async {
              
              switch result {
              case .success(let user):
                  self.user = user
                  self.isLoggedIn = true
                  
              case .failure(let error):
                  print("SignUp Error:", error.localizedDescription)
              }
          }
       }
    }
    
 // SignOut Function:
    func signOut() {
        AuthService.shared.signOut()
        self.user = nil
        self.isLoggedIn = false
    }
}
