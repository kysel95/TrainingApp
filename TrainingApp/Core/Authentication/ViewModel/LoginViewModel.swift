//
//  LoginViewModel.swift
//  TrainingApp
//
//  Created by kysel95 on 21/03/2024.
//

import Foundation

@MainActor
class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws {
        try await AuthService.shared.signIn(withEmail: email, password: password)
    }
    
    func resetPassword() async throws {
        try await AuthService.shared.resetPassword(withEmail: email)
    }
}
