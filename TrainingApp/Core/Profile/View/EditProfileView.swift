//
//  EditProfileView.swift
//  TrainingApp
//
//  Created by kysel95 on 17/03/2024.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    
    @StateObject var viewModel2 = ProfileViewModel()
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var updateFullname = ""
    @State private var updatePassword = ""
    @State private var primaryColor = Color.primary
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGray6)
                    .edgesIgnoringSafeArea([.bottom, .horizontal])
                
                VStack{
                    
                    HStack {
                        VStack(alignment: .leading) {
                            if let user = viewModel.currentUser {
                                Text("Name")
                                    .fontWeight(.semibold)
                                Text(user.fullname)
                            } else {
                                Text("Name")
                                      .fontWeight(.semibold)

                                Text(User.exampleUser.fullname)

                            }

                        }
                        .foregroundColor(.black)

                        
                        Spacer()
                        
                       //PhotosPicker(selection: $viewModel.selectedItem) {
                          //  if let image = $viewModel.profileImage {
                             //   image
                               //     .resizable()
                              //      .scaledToFill()
                                //    .frame(width: 55, height: 55)
                                //    .clipShape(Circle())
                           // } else {
                                ProfileImageView()
                           // }
                       // }

                        
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
        EditProfileView()
            .environmentObject(AuthViewModel())
    }
}
