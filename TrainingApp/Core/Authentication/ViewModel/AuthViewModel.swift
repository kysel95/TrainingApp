//
//  AuthViewModel.swift
//  TrainingApp
//
//  Created by kysel95 on 28/10/2023.
//

import Foundation
import Firebase
import FirebaseAuth

class AuthViewModel: ObservableObject {
    // MARK: - Properties
    
    @Published var errorMessage: String = ""
    
    // MARK: - Functions
    
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self else { return }
            if let error = error as NSError? {
                switch error.code {
                case AuthErrorCode.wrongPassword.rawValue:
                    self.errorMessage = "Invalid email or password."
                case AuthErrorCode.invalidEmail.rawValue:
                    self.errorMessage = "Invalid email address."
                case AuthErrorCode.userNotFound.rawValue:
                    self.errorMessage = "User not found."
                default:
                    self.errorMessage = "An unknown error occurred. Please try again later."
                }
                print("Sign in error: \(error.localizedDescription)")
            } else {
                print("User signed in successfully!")
                // Handle successful sign-in
            }
        }
    }
}
