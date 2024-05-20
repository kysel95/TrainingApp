//
//  SoonView.swift
//  TrainingApp
//
//  Created by kysel95 on 19/05/2024.
//

import SwiftUI
import PhotosUI
import NavigationTransitions

struct SoonView: View {
    
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
//            .navigationBarTitle(Text("Invite your friends").font(.subheadline), displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label : {
                        Image(systemName: "arrowshape.turn.up.backward.circle")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Invite your friends")
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
        SoonView(user: dev.user)
        //SoonView()
    }
}
