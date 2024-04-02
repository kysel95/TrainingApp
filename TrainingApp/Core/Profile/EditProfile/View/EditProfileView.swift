//
//  EditProfileView.swift
//  TrainingApp
//
//  Created by kysel95 on 17/03/2024.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    let user: User
    
    @State private var updateFullname = ""
    @State private var updatePassword = ""
    @State private var primaryColor = Color.primary
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = EditProfileViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGray6)
                    .edgesIgnoringSafeArea([.bottom, .horizontal])
                
                VStack(spacing: 5){
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.semibold)
                            Text(user.fullname ?? "")
                        }
                        .foregroundColor(.black)
                        
                        Spacer()
                        
                        PhotosPicker(selection: $viewModel.selectedItem) {
                            if let image = viewModel.profileImage {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 48, height: 48)
                                    .clipShape(Circle())
                            } else {
                                ProfileImageView(user: user, size: .medium)
                            }
                        }
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading){
                        Text("Change Name")
                            .fontWeight(.semibold)
                        TextField("Enter Name...", text: $updateFullname)
                    }
                    .autocapitalization(.words)
                    
                    Divider()
                    
                    VStack(alignment: .leading){
                        Text("Change Password")
                            .fontWeight(.semibold)
                        
                        SecureField("Enter Password...", text: $updatePassword)
                    }
                    
                    Divider()
                }
                .font(.system(size: 14))
                .font(.footnote)
                .padding()
                .background(.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                )
                .padding()
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        Task {
                            try await viewModel.updateUserData()
                            dismiss()
                        }
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                }
            }
            .preferredColorScheme(.light)
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(user: dev.user)
    }
}
