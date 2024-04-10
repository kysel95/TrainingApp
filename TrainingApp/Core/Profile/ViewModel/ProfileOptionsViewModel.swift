//
//  ProfileOptionsViewModel.swift
//  TrainingApp
//
//  Created by kysel95 on 14/03/2024.
//

import Foundation
import SwiftUI

enum ProfileOptionsViewModel: Int, CaseIterable, Identifiable {
    case darkMode
    case activeStatus
    case accessibility
    case privacy
    case notifications
    
    var title: String {
        switch self {
        case .darkMode: return "Dark mode"
        case .activeStatus: return "Active status"
        case .accessibility: return "Accessibility"
        case .privacy: return "Privacy and Safety"
        case .notifications: return "Notifications"
        }
    }
    
    var imageName: String {
        switch self {
        case .darkMode: return "moon.circle.fill"
        case .activeStatus: return "message.badge.circle.fill"
        case .accessibility: return "person.circle.fill"
        case .privacy: return "lock.circle.fill"
        case .notifications: return "bell.circle.fill"
        }
    }
    
    var imageBackgroundColor: Color {
        switch self {
        case .darkMode: return Color(Color.primary)
        case .activeStatus: return Color(.systemGreen)
        case .accessibility: return Color(Color.primary)
        case .privacy: return Color(.systemBlue)
        case .notifications: return Color(.systemPurple)
        }
    }
    
    var id: Int { return self.rawValue }
}
