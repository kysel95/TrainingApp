//
//  HomeTabViewModel.swift
//  TrainingApp
//
//  Created by kysel95 on 10/04/2024.
//

import Foundation
import SwiftUI

@MainActor
enum Tab: String, Hashable, CaseIterable {
    case house
    case dumbbell
    case figure = "figure.run.circle"
    case clock
    case person
    
    var title: String {
        switch self {
        case .house: return "Home"
        case .dumbbell: return "Exercises"
        case .figure: return "Workout"
        case .clock: return "History"
        case .person: return "Profile"
        }
    }
    
    var imageName: String {
        switch self {
        case .house: return "house"
        case .dumbbell: return "dumbbell"
        case .figure: return "figure.run.circle"
        case .clock: return "clock"
        case .person: return "person"
        }
    }
    
//    var dimension: CGFloat {
//        switch self {
//        case .house: return 22
//        case .dumbbell: return 25
//        case .figure: return 22
//        case .clock: return 22
//        case .person: return 22
//        }
//    }
}
