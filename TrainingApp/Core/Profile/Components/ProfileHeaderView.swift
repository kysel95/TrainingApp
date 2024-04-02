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
    
    init(user: User?) {
        self.user = user
    }
    @State private var primaryColor = Color.primary
    
    var body: some View {
        VStack {
            if let imageUrl = user?.profileImageUrl {
                KFImage(URL(string: imageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
            } else {
                Text(user?.initials ?? "")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 80, height: 80)
                    .background(Color(.systemGray3))
                    .clipShape(Circle())
            }
            Text(user?.fullname ?? "")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(primaryColor)
                .padding(.top, 8)
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
