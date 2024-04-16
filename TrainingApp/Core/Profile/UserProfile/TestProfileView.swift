//
//  TestProfileView.swift
//  TrainingApp
//
//  Created by kysel95 on 26/10/2023.
//

import SwiftUI
import PhotosUI

struct TestProfileView: View {
    //let user: User
    @State private var showEditProfile = false
    @State private var primaryColor = Color.primary
    
    var body: some View {
        ScrollView {
            LazyVStack {
               //ProfileHeaderView(user: user)
               //    .padding()
               //    .frame(maxWidth: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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
    }
}

struct TestProfileView_Previews: PreviewProvider {
    static var previews: some View {
        //TestProfileView(user: dev.user)
        TestProfileView()
    }
}
