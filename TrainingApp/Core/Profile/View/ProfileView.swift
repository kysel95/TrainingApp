//
//  ProfileView.swift
//  TrainingApp
//
//  Created by kysel95 on 26/10/2023.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @StateObject var viewModel2 = ProfileViewModel()
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var showEditProfile = false
    @State private var primaryColor = Color.primary
    
    
    var body: some View {
        NavigationStack {
            
            VStack {
                // header
                VStack {
                    if let user = viewModel.currentUser {
                        PhotosPicker(selection: $viewModel2.selectedItem) {
                            if let profileImage = viewModel2.profileImage {
                                profileImage
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 80, height: 80)
                                    .clipShape(Circle())
                            } else {
                                Text(user.initials)
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .frame(width: 80, height: 80)
                                    .background(Color(.systemGray3))
                                    .clipShape(Circle())
                            }
                        }
                        Text(user.fullname)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(primaryColor)
                            .padding(.top, 8)
                    } else {
                        PhotosPicker(selection: $viewModel2.selectedItem) {
                            if let profileImage = viewModel2.profileImage {
                                profileImage
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 80, height: 80)
                                    .clipShape(Circle())
                            } else {
                                Text(User.exampleUser.initials)
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .frame(width: 80, height: 80)
                                    .background(Color(.systemGray3))
                                    .clipShape(Circle())
                            }
                        }
                        
                        Text(User.exampleUser.fullname)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(primaryColor)
                            .padding(.top, 8)
                    }
                    
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
                                viewModel.signOut()
                            } label: {
                                Text("Log Out")
                            }
                            
                            Button {
                                Task{
                                    do {
                                        try await viewModel.deleteUser()
                                    }
                                }
                            } label: {
                                Text("Delete Account")
                            }
                        }
                        .foregroundColor(.red)
                    }
                }
            }
        }
        .sheet(isPresented: $showEditProfile, content: {
            EditProfileView()
                .environmentObject(AuthViewModel())
        })
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(AuthViewModel())
    }
}
