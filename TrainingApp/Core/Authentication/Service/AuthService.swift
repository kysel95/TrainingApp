import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift
import FirebaseFirestore
import FirebaseStorage
import PhotosUI
import Combine
import SwiftUI

@MainActor
class AuthViewModel: ObservableObject {
    // MARK: - Properties
    
    @Published var errorMessage: String = ""
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        Task {
            
            await fetchUser()
            
        }
    }
    // MARK: - Helper Functions
    
    private func handleAuthError(error: NSError) -> String {
        switch error.code {
        case AuthErrorCode.wrongPassword.rawValue:
            return "Invalid email or password."
        case AuthErrorCode.invalidEmail.rawValue:
            return "Invalid email address."
        case AuthErrorCode.userDisabled.rawValue:
            return "The user account has been disabled by an administrator."
        case AuthErrorCode.emailAlreadyInUse.rawValue:
            return "The email address is already in use by another account."
        case AuthErrorCode.weakPassword.rawValue:
            return "The password must be 6 characters long or more."
        case AuthErrorCode.userNotFound.rawValue:
            return "No account found with this email address."
        case AuthErrorCode.invalidRecipientEmail.rawValue:
            return "The recipient email address is invalid."
        case AuthErrorCode.missingEmail.rawValue:
            return "The email address is missing."
        case AuthErrorCode.invalidSender.rawValue:
            return "The sender email address is invalid."
        case AuthErrorCode.invalidMessagePayload.rawValue:
            return "The message payload is invalid."
        case AuthErrorCode.operationNotAllowed.rawValue:
            return "This operation is not allowed."
        case AuthErrorCode.requiresRecentLogin.rawValue:
            return "This operation is sensitive and requires recent authentication. Log in again before retrying this request."
        case AuthErrorCode.networkError.rawValue:
            return "A network error occurred. Please check your internet connection and try again."
        case AuthErrorCode.keychainError.rawValue:
            return "A keychain error occurred. Please try again."
        default:
            return "An unknown error occurred. Please try again later."
        }
    }
    // MARK: - Functions
    
    func signIn(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
            print("User signed in successfully!")
        } catch {
            self.errorMessage = handleAuthError(error: error as NSError)
            print("Sign in error: \(error.localizedDescription)")
        }
    }
    
    func createUser(email: String, fullname: String, password: String, confirmPassword: String) async throws {
        guard password == confirmPassword else {
            errorMessage = "Passwords do not match."
            return
        }
        guard password.count >= 6 else {
            errorMessage = "The password must be at least 6 characters long."
            return
        }
        
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await self.uploadUserData(email: email, fullname: fullname, id: result.user.uid)
            await fetchUser()
            print("User created successfully!")
        } catch {
            self.errorMessage = handleAuthError(error: error as NSError)
            print("User creation error: \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
            print("User signed out successfully!")
        } catch {
            print("Sign out error: \(error.localizedDescription)")
        }
    }
    
    func fetchUser() async {
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        self.currentUser = try? snapshot.data(as: User.self)
        
        print("DEBUG: Current user is \(String(describing: self.currentUser))")
        
    }
    
    func deleteUser() async throws {
        do {
            try await Auth.auth().currentUser?.delete()
            self.userSession = nil
            self.currentUser = nil
            print("User deleted successfully!")
        } catch {
            self.errorMessage = handleAuthError(error: error as NSError)
            print("User deletion error: \(error.localizedDescription)")
        }
    }
    
    func resetPassword(email: String) async throws {
        do {
            try await Auth.auth().sendPasswordReset(withEmail: email)
            print("Password reset email sent successfully!")
        } catch {
            self.errorMessage = handleAuthError(error: error as NSError)
            print("Password reset error: \(error.localizedDescription)")
        }
    }
    
    private func uploadUserData(email: String, fullname: String, id: String) async throws {
        let user = User(fullname: fullname, email: email, profileImageUrl: nil)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(encodedUser)
    }
}
