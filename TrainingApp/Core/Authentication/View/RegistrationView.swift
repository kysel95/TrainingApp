//
//  RegistrationView.swift
//  TrainingApp
//
//  Created by kysel95 on 26/10/2023.
//

import SwiftUI

struct RegistrationView: View {
    // MARK: - Properties
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = RegistrationViewModel()
    @State private var showAlert = false
    @State private var primaryColor = Color.primary
    @State private var passwordsMatch = false
    
    // MARK: - Body
    var body: some View {
            VStack {
                Spacer()
                Image("Logo2")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .padding(.bottom, 20)
                    .padding()
                // MARK: - Registration
                VStack(spacing: 10) {
                    HStack {
                        TextField("Email", text: $viewModel.email)
                            .font(.system(size: 20))
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .padding(10)
                            .foregroundColor(primaryColor)
                            .overlay(
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(Color.blue, lineWidth: 2)
                            )
                    }
                    .frame(width: UIScreen.main.bounds.width - 32, height:48)
                    .padding(.bottom, 10)
                    HStack {
                        TextField("User Name", text: $viewModel.username)
                            .font(.system(size: 20))
                            .autocapitalization(.words)
                            .padding(10)
                            .foregroundColor(primaryColor)
                            .overlay(
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(Color.blue, lineWidth: 2)
                            )
                    }
                    .frame(width: UIScreen.main.bounds.width - 32, height:48)
                    .padding(.bottom, 10)
                    HStack {
                        SecureField("Password", text: $viewModel.password)
                            .font(.system(size: 20))
                            .padding(10)
                            .foregroundColor(primaryColor)
                            .overlay(
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(Color.blue, lineWidth: 2)
                            )
                    }
                    .frame(width: UIScreen.main.bounds.width - 32, height:48)
                    .padding(.bottom, 10)
                    HStack {
                        SecureField("Confirm Password", text: $viewModel.confirmPassword, onCommit: {
                            passwordsMatch = viewModel.confirmPassword == viewModel.password
                        })
                        .font(.system(size: 20))
                        .padding(10)
                        .foregroundColor(primaryColor)
                        Image(systemName: passwordsMatch ? "checkmark.circle.fill" : "checkmark.circle")
                            .font(.system(size: 20))
                            .foregroundColor(passwordsMatch ? .green : .gray)
                            .padding(10)
                            .alignmentGuide(.trailing) { $0[.trailing] }
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.blue, lineWidth: 2)
                    )
                    .frame(width: UIScreen.main.bounds.width - 32, height:48)
                    .padding(.bottom, 10)
                    Button {
                        Task {
                            do{
                                try await viewModel.createUser()
                            }

                        }
                    } label: {
                        HStack {
                            Spacer()
                            Text("SIGN UP")
                                .fontWeight(.semibold)
                            Image(systemName: "arrow.right.circle")
                                .padding(.leading, 5)
                            Spacer()
                        }
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 32, height:48)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(10)
                    }
                }
                .padding(10)
                
                Spacer()
                
                Divider()
                
                Button {
                    dismiss()
                } label: {
                    HStack(spacing:3) {
                        Text("Already have an account?")
                        Text("Sign In")
                            .fontWeight(.bold)
                    }
                    .padding(.vertical, 16)
                    .font(.footnote)
                }
            }
            .padding(.horizontal)
            .alert("Error", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(AuthService.shared.errorMessage)
            }
            .onReceive(AuthService.shared.$errorMessage) { newValue in
                showAlert = !newValue.isEmpty
            }
        }
    }
// MARK: - Preview
struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
