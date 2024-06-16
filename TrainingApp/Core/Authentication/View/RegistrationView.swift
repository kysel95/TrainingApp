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
                    }
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .modifier(TextFieldModifier())
                    
                    HStack {
                        TextField("User Name", text: $viewModel.username)

                    }
                    .autocapitalization(.none)
                    .modifier(TextFieldModifier())
                    
                    HStack {
                        SecureField("Password", text: $viewModel.password)
                    }
                    .modifier(TextFieldModifier())
                    
                    HStack {
                        SecureField("Confirm Password", text: $viewModel.confirmPassword, onCommit: {
                            passwordsMatch = viewModel.confirmPassword == viewModel.password
                        })
                        Image(systemName: passwordsMatch ? "checkmark.circle.fill" : "checkmark.circle")
                            .foregroundColor(passwordsMatch ? .green : .gray)
                            .alignmentGuide(.trailing) { $0[.trailing] }
                    }
                    .modifier(TextFieldModifier())
                    
                    Button {
                        Task {
                            do{
                                try await viewModel.createUser()
                            }

                        }
                    } label: {
                        HStack {
                            Text("SIGN UP")
                                .fontWeight(.semibold)
                            Image(systemName: "arrow.right.circle")
                                .padding(.leading, 5)
                        }
                        .foregroundColor(.white)
                        .frame(width: 352, height: 44)
                        .background(Color.blue)
                        .cornerRadius(8)
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
                    .foregroundColor(.white)
                }
            }
            .modifier(BackgroundModifier())
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
