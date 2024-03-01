//
//  LoginView.swift
//  TrainingApp
//
//  Created by kysel95 on 26/10/2023.
//

import SwiftUI

struct LoginView: View {
    // MARK: - Properties
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var showAlert = false
    @State private var primaryColor = Color.primary
    
    // MARK: - Body
    var body: some View {
        // MARK: - Logo
        VStack {
            Spacer()
            Image("Logo")
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .padding(.vertical, 32)

            Text("Login")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            // MARK: - Login
            VStack(spacing: 20) {
                HStack {
                    TextField("Email", text: $email)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        .padding(.vertical, 10)
                        .foregroundColor(primaryColor)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.blue, lineWidth: 2)
                        )
                }
                .frame(width: UIScreen.main.bounds.width - 32, height:48)
                .padding(.bottom, 10)
                
                HStack {
                    SecureField("Password", text: $password)
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        .padding(.vertical, 10)
                        .foregroundColor(primaryColor)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.blue, lineWidth: 2)
                        )
                }
                .frame(width: UIScreen.main.bounds.width - 32, height:48)
                .padding(.bottom, 10)
                
                Button {
                    viewModel.signIn(email: email, password: password)
                } label: {
                    HStack {
                        Spacer()
                        Text("SIGN IN")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right.circle")
                            .padding(.leading, 5)
                        Spacer()
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height:48)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.top, 10)
                }
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 40)
            
            
            Spacer()
        }
        .padding(.horizontal)
        .alert("Error", isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(viewModel.errorMessage)
        }
        .onReceive(viewModel.$errorMessage) { newValue in
            showAlert = !newValue.isEmpty
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
