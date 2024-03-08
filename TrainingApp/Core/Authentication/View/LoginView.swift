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
    @State private var showAlert: Bool = false
    @State private var primaryColor = Color.primary
    @State private var isPasswordVisible = false
    
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
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
                    .foregroundColor(primaryColor)
                // MARK: - Login
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
                        if isPasswordVisible {
                            TextField("Password", text: $password)
                                .font(.system(size: 20))
                                .padding(.leading, 10)
                                .padding(.trailing, 10)
                                .padding(.vertical, 10)
                                .foregroundColor(primaryColor)
                        } else {
                            SecureField("Password", text: $password)
                                .font(.system(size: 20))
                                .padding(.leading, 10)
                                .padding(.trailing, 10)
                                .padding(.vertical, 10)
                                .foregroundColor(primaryColor)
                        }
                        
                        Button {
                            isPasswordVisible.toggle()
                        } label: {
                            Image(systemName: isPasswordVisible ? "eye.fill" : "eye.slash.fill")
                                .foregroundColor(.gray)
                                .font(.system(size: 20))
                        }
                        .padding(.trailing, 10)
                        .padding(.vertical, 10)
                        .alignmentGuide(.trailing) { $0[.trailing] }
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.blue, lineWidth: 2)
                    )
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                    .padding(.bottom, 10)
                    
                    HStack{
                        Button{
                            Task{
                                do{
                                    try await viewModel.resetPassword(email: email)
                                }
                            }
                        } label : {
                            Text("Forgot Password?")
                                .fontWeight(.semibold)
                                .foregroundColor(.blue)
                                .frame(width: UIScreen.main.bounds.width - 200, height:20)
                        }
                    }
                    .cornerRadius(10)
                    .padding(.leading,200)
                    
                    Button {
                        Task{
                            do{
                                try await viewModel.signIn(email: email, password: password)
                            }
                        }
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
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 2) {
                        Text("Dont have an account?")
                        Text("Sign up")
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
}

// MARK: - Preview
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(AuthViewModel())
    }
}
