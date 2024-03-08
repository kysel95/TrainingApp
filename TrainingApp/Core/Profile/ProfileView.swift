//
//  ProfileView.swift
//  TrainingApp
//
//  Created by kysel95 on 26/10/2023.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            if let user = viewModel.currentUser {
                Text("Welcome, \(user.fullname)!")
                    .font(.title)
                    .padding()
                
                Text("Initials: \(user.initials)")
                Text("Email: \(user.email)")
            }
            
            Button {
                viewModel.signOut()
            } label: {
                HStack {
                    Text("Sign Out")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(AuthViewModel())
    }
}
