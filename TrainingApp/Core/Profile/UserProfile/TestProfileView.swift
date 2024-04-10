//
//  TestProfileView.swift
//  TrainingApp
//
//  Created by kysel95 on 26/10/2023.
//

import SwiftUI
import PhotosUI

struct TestProfileView: View {
    let user: User
    @State private var showEditProfile = false
    @State private var primaryColor = Color.primary
    
    var body: some View {
        VStack {
            List {
                ProfileHeaderView(user: user)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Section {
                    Text("TEST number 1")
                }
                Section {
                    Text("TEST number 2")
                }
                Section {
                    Text("TEST number 2")
                }
                Section {
                    Text("TEST number 2")
                }
                Section {
                    Text("TEST number 2")
                }
                Section {
                    Text("TEST number 2")
                }
                Section {
                    Text("TEST number 2")
                }
                Section {
                    Text("TEST number 2")
                }
                Section {
                    Text("TEST number 2")
                }
                Section {
                    Text("TEST number 2")
                }
                Section {
                    Text("TEST number 2")
                }
            }
            .listRowBackground(Color.green)
        }
        .modifier(BackgroundModifier())
    }
}

struct TestProfileView_Previews: PreviewProvider {
    static var previews: some View {
        TestProfileView(user: dev.user)
    }
}
