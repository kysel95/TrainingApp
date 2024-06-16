//
//  SoonView.swift
//  TrainingApp
//
//  Created by kysel95 on 19/05/2024.
//

import SwiftUI
import PhotosUI
import NavigationTransitions

enum SoonViewTitle {
    case inviteFriends
    case statistics
    case shareProgress

    
    var Title: String {
        switch self {
        case .inviteFriends: return "Invite your friends"
        case .statistics: return "Statistics"
        case .shareProgress: return "Share your progress"
        }
    }
}
struct SoonView: View {
    
    let barTitle: SoonViewTitle
    var user: User?
    @State private var primaryColor = Color.white
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            LazyVStack(spacing: 50) {
                HStack {
                    Text("Hello")
                    Text("\(user?.username ?? "")!")
                        .foregroundColor(.red)
                }
                VStack(alignment: .leading, spacing: 20) {
                    Text("This functionality is not yet available.")
                    Text("It will be added in the next updates!")
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label : {
                        Image(systemName: "arrowshape.turn.up.backward.circle")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Text(barTitle.Title)
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                }
            }
            .modifier(BackgroundModifier())
            .foregroundStyle(primaryColor)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding()
        }
        .navigationBarBackButtonHidden(true)
        .navigationTransition(.fade(.cross))
    }
}

struct SoonView_Previews: PreviewProvider {
    static var previews: some View {
        SoonView(barTitle: .statistics, user: dev.user)
        //SoonView()
    }
}
