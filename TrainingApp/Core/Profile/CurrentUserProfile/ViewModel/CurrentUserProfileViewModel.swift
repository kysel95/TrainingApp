//
//  ProfileViewModel.swift
//  TrainingApp
//
//  Created by kysel95 on 18/03/2024.
//

import Foundation
import Combine
import SwiftUI
import PhotosUI

@MainActor
class ProfileViewModel: ObservableObject {
    
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
            print("DEBUG: User in view model from combine is \(user)")
        }.store(in: &cancellables)
    }
}
