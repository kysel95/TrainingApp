//
//  PreviewProvider.swift
//  TrainingApp
//
//  Created by kysel95 on 23/03/2024.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(uid: NSUUID().uuidString, fullname: "Marcin Tester", username: "Tester", email: "Tester@gmail.com", profileImageUrl: nil)
}
