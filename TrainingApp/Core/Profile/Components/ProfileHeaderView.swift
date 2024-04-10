//
//  ProfileHeaderView.swift
//  TrainingApp
//
//  Created by kysel95 on 26/03/2024.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    
    var user: User?
    
    @State private var primaryColor = Color.primary
    
    var body: some View {
        VStack {
            
            ProfileImageView(user: user, size: .xLarge)
            
            Text(user?.username ?? "")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(primaryColor)
                .padding(.top, 8)
            }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: dev.user)
    }
}
