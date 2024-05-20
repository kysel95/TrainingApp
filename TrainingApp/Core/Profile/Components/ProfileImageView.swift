//
//  ProfileImageView.swift
//  TrainingApp
//
//  Created by kysel95 on 17/03/2024.
//

import SwiftUI
import Kingfisher

enum ProfileImageViewSize {
    case xxSmall
    case xSmall
    case small
    case medium
    case large
    case xLarge
    case xxLarge
    
    var dimension: CGFloat {
        switch self {
        case .xxSmall: return 28
        case .xSmall: return 32
        case .small: return 40
        case .medium: return 48
        case .large: return 64
        case .xLarge: return 80
        case .xxLarge: return 100
        }
    }
}

struct ProfileImageView: View {
    
    var user: User?
    let size: ProfileImageViewSize
    
    @State private var primaryColor = Color.primary
    
    var body: some View {
        if let imageUrl = user?.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        } else {
            Text(user?.initials ?? "")
                .font(.system(size: 50))
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(width: size.dimension, height: size.dimension)
                .background(.profile)
                .clipShape(Circle())
            
        }
    }
    
    
}
    
struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImageView(user: dev.user, size: .xxLarge)
    }
}
