//
//  RegisterView.swift
//  CookBookPro
//
//  Created by Kadeem Cherman on 2026-06-24.
//

import SwiftUI

struct RegisterView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var errorMsg = ""
    @State private var showErr = false
    
    var body: some View {
        Form {
            Section("Account") {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
                    .textInputAutocapitalization(.never)
                SecureField("Password", text: $password)
                SecureField("Confirm Password", text: $confirmPassword)
            }
            Section {
                Button("Create Account") {
                    register()
                }
            }
        }
        .navigationTitle("Register")
        .alert("Registration Error", isPresented: $showErr) {
            Button("Ok") { }
        } message: {
            Text(errorMsg)
        }
    }
    
    private func register() {
        guard !username.isEmpty else {
            errorMsg = "Username is required"
            showErr = true
            return
        }
        
        guard !email.isEmpty else {
            errorMsg = "Email is required"
            showErr = true
            return
        }
        
        guard password.count >= 7 else {
            errorMsg = "Password must be at least 7 characters"
            showErr = true
            return
        }
        
        guard password == confirmPassword else {
            errorMsg = "Passwords do not match"
            showErr = true
            return
        }
        
        AuthService.shared.signUp(
              email: email,
              password: password) { error in
                  if let error {
                      DispatchQueue.main.async {
                          errorMsg = error.localizedDescription
                          showErr = true
                      }
                      return
                  }
                  DispatchQueue.main.async {
                      dismiss()
                  }
              }
       }
}

#Preview {
    NavigationStack {
    RegisterView()
  }
}
