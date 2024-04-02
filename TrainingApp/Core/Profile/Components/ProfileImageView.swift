//
//  ProfileImageView.swift
//  TrainingApp
//
//  Created by kysel95 on 17/03/2024.
//

import SwiftUI
import Kingfisher

struct ProfileImageView: View {
    
    var user: User?
    
    init(user: User?) {
        self.user = user
    }
    
    @State private var primaryColor = Color.primary
    
    var body: some View {
        if let imageUrl = user?.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 55, height: 55)
                .clipShape(Circle())
        } else {
            Text(user?.initials ?? "")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(width: 55, height: 55)
                .background(Color(.systemGray3))
                .clipShape(Circle())
        }
    }
}
    
struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImageView(user: dev.user)
    }
}
