//
//  ProfileImageView.swift
//  TrainingApp
//
//  Created by kysel95 on 17/03/2024.
//

import SwiftUI
import PhotosUI

struct ProfileImageView: View {
    
    @StateObject var viewModel2 = ProfileViewModel()
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if let user = viewModel.currentUser {
            PhotosPicker(selection: $viewModel2.selectedItem) {
                if let profileImage = viewModel2.profileImage {
                    profileImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 55, height: 55)
                        .clipShape(Circle())
                } else {
                    Text(user.initials)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 55, height: 55)
                        .background(Color(.systemGray3))
                        .clipShape(Circle())
                }
            }
            
        } else {
            PhotosPicker(selection: $viewModel2.selectedItem) {
                if let profileImage = viewModel2.profileImage {
                    profileImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 55, height: 55)
                        .clipShape(Circle())
                } else {
                    Text(User.exampleUser.initials)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 55, height: 55)
                        .background(Color(.systemGray3))
                        .clipShape(Circle())
                }
            }
            
        }
    }
}
struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImageView()
            .environmentObject(AuthViewModel())
    }
}
