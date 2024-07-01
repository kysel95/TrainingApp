//
//  ProfileEnumsViewModel.swift
//  TrainingApp
//
//  Created by kysel95 on 14/03/2024.
//

import Foundation
import SwiftUI

enum Settings: Int, CaseIterable, Identifiable {
    case editProfile
    case setsOfExercises
    case alerts
    case sound
    case connections
    
    var title: String {
        switch self {
        case .editProfile: return "Edit profile"
        case .setsOfExercises: return "Sets of exercises"
        case .alerts: return "Alerts"
        case .sound: return "Sound"
        case .connections: return "Connections"
        }
    }
    
    var imageName: String {
        switch self {
        case .editProfile: return "applepencil.gen1"
        case .setsOfExercises: return "square.and.arrow.down.fill"
        case .alerts: return "bell.fill"
        case .sound: return "speaker.wave.2.fill"
        case .connections: return "app.connected.to.app.below.fill"
        }
    }
    
    var imageBackgroundColor: Color {
        switch self {
        case .editProfile: return Color((Color.basicTitle).opacity(0.8))
        case .setsOfExercises: return Color((Color.basicTitle).opacity(0.8))
        case .alerts: return Color((Color.basicTitle).opacity(0.8))
        case .sound: return Color((Color.basicTitle).opacity(0.8))
        case .connections: return Color((Color.basicTitle).opacity(0.8))
        }
    }
    
    var destination: some View {
        switch self {
        case .editProfile: return SoonView(barTitle: .inviteFriends)
        case .setsOfExercises: return SoonView(barTitle: .statistics)
        case .alerts: return SoonView(barTitle: .shareProgress)
        case .sound: return SoonView(barTitle: .inviteFriends)
        case .connections: return SoonView(barTitle: .inviteFriends)
        }
    }
    
    var id: Int { return self.rawValue }
}
enum Instructions: Int, CaseIterable, Identifiable {
    case exerciseList
    
    var title: String {
        switch self {
        case .exerciseList: return "Exercise list"
        }
    }
    
    var imageName: String {
        switch self {
        case .exerciseList: return "list.bullet.below.rectangle"
        }
    }
    
    var imageBackgroundColor: Color {
        switch self {
        case .exerciseList: return Color((Color.basicTitle).opacity(0.8))
        }
    }
    
    var destination: some View {
        switch self {
        case .exerciseList: return SoonView(barTitle: .inviteFriends)
        }
    }
    
    var id: Int { return self.rawValue }
}
enum Feedbacks: Int, CaseIterable, Identifiable {
    case rateTheApp
    case sendFeedback
    
    var title: String {
        switch self {
        case .rateTheApp: return "Rate the app"
        case .sendFeedback: return "Send feedback"
        }
    }
    
    var imageName: String {
        switch self {
        case .rateTheApp: return "star.fill"
        case .sendFeedback: return "ellipsis.message.fill"
        }
    }
    
    var imageBackgroundColor: Color {
        switch self {
        case .rateTheApp: return Color((Color.basicTitle).opacity(0.8))
        case .sendFeedback: return Color((Color.basicTitle).opacity(0.8))
        }
    }
    
    var destination: some View {
        switch self {
        case .rateTheApp: return SoonView(barTitle: .inviteFriends)
        case .sendFeedback: return SoonView(barTitle: .inviteFriends)
        }
    }
    
    var id: Int { return self.rawValue }
}
enum Followus: Int, CaseIterable, Identifiable {
    case instagram
    case facebook
    case twitter
    
    var title: String {
        switch self {
        case .instagram: return "Instagram"
        case .facebook: return "Facebook"
        case .twitter: return "Twitter"
        }
    }
    
    var imageName: String {
        switch self {
        case .instagram: return "instagram"
        case .facebook: return "facebook-square-fill"
        case .twitter: return "twitter-fill"
        }
    }
    
    var imageBackgroundColor: Color {
        switch self {
        case .instagram: return Color((Color.basicTitle).opacity(0.8))
        case .facebook: return Color((Color.basicTitle).opacity(0.8))
        case .twitter: return Color((Color.basicTitle).opacity(0.8))
        }
    }
    
    var destination: some View {
        switch self {
        case .instagram: return SoonView(barTitle: .inviteFriends)
        case .facebook: return SoonView(barTitle: .statistics)
        case .twitter: return SoonView(barTitle: .shareProgress)
        }
    }
    
    var id: Int { return self.rawValue }
}
enum Logout: Int, CaseIterable, Identifiable {
    case logout
    
    var title: String {
        switch self {
        case .logout: return "Log out"
        }
    }
    
    var imageName: String {
        switch self {
        case .logout: return "rectangle.portrait.and.arrow.right"
        }
    }
    
    var imageBackgroundColor: Color {
        switch self {
        case .logout: return Color((Color.basicTitle).opacity(0.8))
        }
    }
    
    var id: Int { return self.rawValue }
}
