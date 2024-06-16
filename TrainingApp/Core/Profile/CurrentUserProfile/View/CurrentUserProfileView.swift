//
//  CurrentUserProfileView.swift
//  TrainingApp
//
//  Created by kysel95 on 23/03/2024.
//

import Foundation
import SwiftUI


struct CurrentUserProfileView: View {
    
    @StateObject var viewModel = CurrentUserProfileViewModel()
    @State private var showEditProfile = false
    @State private var primaryColor = Color.primary
    
    private var currentUser: User? {
        return viewModel.currentUser
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                // header
                ProfileHeaderView(user: currentUser)
                
                Button {
                    showEditProfile.toggle()
                } label: {
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .frame(width: 353, height: 32)
                        .background(.white)
                        .cornerRadius(8)
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(.systemGray4), lineWidth: 1)
                        }
                }
                // list
                List {
                    Section {
                        ForEach(Settings.allCases) { setting in
                            HStack {
                                Image(systemName: setting.imageName)
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(setting.imageBackgroundColor)
                                Text(setting.title)
                                    .font(.subheadline)
                            }
                        }
                    }
                    Section {
                        Button {
                            AuthService.shared.signOut()
                        } label: {
                            Text("Log Out")
                        }
                        Button {
                            Task{
                                do {
                                    try await AuthService.shared.deleteUser()
                                }
                            }
                        } label: {
                            Text("Delete Account")
                        }
                        
                    }
                    .foregroundColor(.red)
                }
            }
            .modifier(BackgroundModifier())
        }
        .sheet(isPresented: $showEditProfile, content: {
            if let user = currentUser{
                EditProfileView(user: user)
            }
        })
    }
}

struct CurrentUserProfileView_Previews : PreviewProvider {
    static var previews: some View {
        CurrentUserProfileView()
    }
}
