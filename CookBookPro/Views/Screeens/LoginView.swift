//
//  LoginView.swift
//  CookBookPro
//
//  Created by Kadeem Cherman on 2026-06-24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var errorMsg = ""
    @State private var showErr = false
    @State private var showRegstr = false
    
    var body: some View {
        NavigationStack {
            
            VStack(spacing: 23) {
                Spacer()
                
                Image(systemName: "fork.knife.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                
                Text("CookBook Pro")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Sign In To Continue")
                    .foregroundStyle(.secondary)
                
                VStack(spacing: 17) {
                    TextField("Email", text: $email)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled()
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(13)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(13)
                }
                
                Button {
                    signIn()
                } label: {
                    Text("Sign In")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                }
                .buttonStyle(.borderedProminent)
                
                Button {
                    showRegstr = true
                } label : {
                    Text("Create Your Account")
                }
                
                Spacer()
            }
            .padding()
            .navigationDestination(isPresented: $showRegstr) {
                RegisterView()
            }
            .alert("Login Error", isPresented: $showErr)
            {
                Button("Ok") { }
            } message: {
                Text(errorMsg)
            }
        }
    }
  
    private func signIn() {
        guard !email.isEmpty else {
            errorMsg = "Please enter your email"
            showErr = true
            return
        }
        
        guard !password.isEmpty else {
            errorMsg = "Please enter your password"
            showErr = true
            return
        }
        
        AuthService.shared.signIn(
            email: email,
            password: password
        ) { result in
        
                DispatchQueue.main.async {
                    switch result {
                    case .success: print("Login Successful")
                    case .failure(let error): errorMsg = error.localizedDescription
                        showErr = true
                    }
                }
           }
      }
}

#Preview {
    LoginView()
}
