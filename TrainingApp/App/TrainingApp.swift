//
//  TrainingApp.swift
//  TrainingApp
//
//  Created by kysel95 on 16/10/2023.
//

import SwiftUI
import Firebase

@main
struct TrainingApp: App {
    // MARK: - Instance of AuthViewModel
    @StateObject var viewModel = AuthViewModel()
    // MARK: - Initialize Firebase
    init() {
        FirebaseApp.configure()
    }
    // MARK: - Pass viewModel to ContentView
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
