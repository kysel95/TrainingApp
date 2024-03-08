//
//  RegistrationView.swift
//  TrainingApp
//
//  Created by kysel95 on 26/10/2023.
//

import SwiftUI

struct RegistrationView: View {
    // MARK: - Properties
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var showAlert = false
    @State private var primaryColor = Color.primary
    @State private var passwordsMatch = false
    
    // MARK: - Body
    var body: some View {
            VStack {
                Spacer()
                Image("Logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .padding(.vertical, 32)
                
                Text("Registration")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                    .foregroundColor(primaryColor)
                // MARK: - Registration
                VStack(spacing: 10) {
                    HStack {
                        TextField("Email", text: $email)
                            .font(.system(size: 20))
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
                        TextField("Full Name", text: $fullname)
                            .font(.system(size: 20))
                            .autocapitalization(.words)
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
                            .font(.system(size: 20))
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
                        SecureField("Confirm Password", text: $confirmPassword, onCommit: {
                            passwordsMatch = confirmPassword == password
                        })
                        .font(.system(size: 20))
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        .padding(.vertical, 10)
                        .foregroundColor(primaryColor)
                        
                        Image(systemName: passwordsMatch ? "checkmark.circle.fill" : "checkmark.circle")
                            .font(.system(size: 20))
                            .foregroundColor(passwordsMatch ? .green : .gray)
                            .padding(.trailing, 10)
                            .padding(.vertical, 10)
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
                                try await viewModel.createUser(email: email, fullname: fullname, password: password, confirmPassword: confirmPassword)
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
                        .padding(.top, 10)
                    }
                }
                .padding(.horizontal, 40)
                .padding(.bottom, 40)
                
                Button {
                    dismiss()
                } label: {
                    HStack(spacing:3) {
                        Text("Already have an account?")
                        Text("Sign In")
                            .fontWeight(.bold)
                    }
                    .font(.system(size:14))
                }
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

// MARK: - Preview
struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
            .environmentObject(AuthViewModel())
    }
}
