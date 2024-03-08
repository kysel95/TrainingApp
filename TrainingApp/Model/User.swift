//
//  User.swift
//  TrainingApp
//
//  Created by kysel95 on 28/10/2023.
//

import Foundation


struct User: Identifiable, Codable {
    
    
    let id: String
    let fullname: String
    let email: String
    
    var initials: String {
        
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        
        return ""
    }
}
