//
//  RegistrationViewModel.swift
//  TrainingApp
//
//  Created by kysel95 on 21/03/2024.
//

import Foundation

@MainActor
class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var username = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    
    func createUser() async throws {
        try await AuthService.shared.createUser(withEmail: email, username: username, password: password, confirmPassword: confirmPassword)
    }
}
