//
//  BackgroundModifier.swift
//  TrainingApp
//
//  Created by kysel95 on 07/04/2024.
//

import Foundation
import SwiftUI

struct BackgroundModifier : ViewModifier {
    
    @State private var primaryColor = Color.primary
    
    func body(content: Content) -> some View {
        content
            .background {
                Image("Blue-Background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width:UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
            }
            .scrollContentBackground(.hidden)
    }
}
