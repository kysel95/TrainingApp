//
//  TestProfileView.swift
//  TrainingApp
//
//  Created by kysel95 on 26/10/2023.
//

import SwiftUI
import PhotosUI
import NavigationTransitions

struct TestProfileView: View {
    var user: User?
    @StateObject var viewModel = CurrentUserProfileViewModel()
    @State private var showEditProfile = false
    @State private var primaryColor = Color.white
    
    private var currentUser: User? {
        return viewModel.currentUser
    }
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    NavigationLink {
                        SoonView(user: user)
                    } label: {
                        HStack {
                            Image(systemName:"person.2.fill")
                            Text("Invite friends")
                                .fontWeight(.semibold)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                        .padding()
                    }
                    ProfileHeaderView(user: user)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Section {
                        VStack(alignment: .leading) {
                            Text("Test title")
                                .font(.title)
                            Text("This is a subtitle")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Text("A1B2C3D4F5G6H7J8K9L0")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    VStack(alignment: .leading) {
                        Text("Test title")
                            .font(.title)
                        Text("This is a subtitle")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text("A1B2C3D4F5G6H7J8K9L0")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    VStack(alignment: .leading) {
                        Text("Test title")
                            .font(.title)
                        Text("This is a subtitle")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text("A1B2C3D4F5G6H7J8K9L0")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    VStack(alignment: .leading) {
                        Text("Test title")
                            .font(.title)
                        Text("This is a subtitle")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text("A1B2C3D4F5G6H7J8K9L0")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    VStack(alignment: .leading) {
                        Text("Test title")
                            .font(.title)
                        Text("This is a subtitle")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text("A1B2C3D4F5G6H7J8K9L0")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    VStack(alignment: .leading) {
                        Text("Test title")
                            .font(.title)
                        Text("This is a subtitle")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text("A1B2C3D4F5G6H7J8K9L0")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    VStack(alignment: .leading) {
                        Text("Test title")
                            .font(.title)
                        Text("This is a subtitle")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text("A1B2C3D4F5G6H7J8K9L0")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    VStack(alignment: .leading) {
                        Text("Test title")
                            .font(.title)
                        Text("This is a subtitle")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text("A1B2C3D4F5G6H7J8K9L0")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    VStack(alignment: .leading) {
                        Text("Test title")
                            .font(.title)
                        Text("This is a subtitle")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text("A1B2C3D4F5G6H7J8K9L0")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                }
            }
            .modifier(BackgroundModifier())
            .foregroundStyle(primaryColor)
        }
        .navigationTransition(.fade(.cross))
        .accentColor(.white)
    }
}

struct TestProfileView_Previews: PreviewProvider {
    static var previews: some View {
        TestProfileView(user: dev.user)
        //TestProfileView()
    }
}
