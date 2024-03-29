//
//  ContentView.swift
//  TrainingApp
//
//  Created by kysel95 on 30/09/2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        // MARK: - Display LoginView as first page
        Group {
            
            if viewModel.userSession != nil {
                ProfileView()
            } else {
                LoginView()
            }
        
        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthViewModel())
    }
}
