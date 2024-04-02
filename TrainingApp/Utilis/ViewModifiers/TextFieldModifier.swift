//
//  TextFieldModifier.swift
//  TrainingApp
//
//  Created by kysel95 on 02/04/2024.
//

import Foundation
import SwiftUI

struct TextFieldModifier : ViewModifier {
    
    @State private var primaryColor = Color.primary
    
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .foregroundColor(primaryColor)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.blue, lineWidth: 2)
            )
            .background(Color(.systemGray6))
            .padding(.bottom, 10)
    }
}
