//
//  ProfileView.swift
//  TrainingApp
//
//  Created by kysel95 on 26/10/2023.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    let user: User
    @State private var showEditProfile = false
    @State private var primaryColor = Color.primary
    
    var body: some View {
        VStack {
            // header
            ProfileHeaderView(user: user)
            
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
                    ForEach(ProfileOptionsViewModel.allCases) { option in
                        HStack {
                            Image(systemName: option.imageName)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(option.imageBackgroundColor)
                            Text(option.title)
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
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: dev.user)
    }
}
