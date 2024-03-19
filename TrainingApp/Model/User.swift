//
//  User.swift
//  TrainingApp
//
//  Created by kysel95 on 28/10/2023.
//

import Foundation
import FirebaseFirestoreSwift


struct User: Identifiable, Codable, Hashable {
    
    @DocumentID var uid: String?
    let fullname: String
    let email: String
    var profileImageUrl: String?
    
    var id: String {
        return uid ?? NSUUID().uuidString
    }
    
    var initials: String {
        
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        
        return ""
    }
}

extension User {
    
    static var exampleUser = User(fullname: "Marcin Tester", email: "Marcin.Tester@gmail.com", profileImageUrl: "Tester")
    
}
