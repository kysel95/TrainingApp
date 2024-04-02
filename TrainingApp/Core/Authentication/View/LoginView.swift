//
//  LoginView.swift
//  TrainingApp
//
//  Created by kysel95 on 26/10/2023.
//
import SwiftUI

struct LoginView: View {
    // MARK: - Properties
    @StateObject var viewModel = LoginViewModel()
    @State private var showAlert: Bool = false
    @State private var primaryColor = Color.primary
    @State private var isPasswordVisible = false

    // MARK: - Body
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Image("Logo2")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .padding(.bottom, 20)
                    .padding()
                // MARK: - Login
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
                        if isPasswordVisible {
                            TextField("Password", text: $viewModel.password)
                                .font(.system(size: 20))
                                .padding(10)
                                .foregroundColor(primaryColor)
                        } else {
                            SecureField("Password", text: $viewModel.password)
                                .font(.system(size: 20))
                                .padding(10)
                                .foregroundColor(primaryColor)
                        }
                        Button {
                            isPasswordVisible.toggle()
                        } label: {
                            Image(systemName: isPasswordVisible ? "eye.fill" : "eye.slash.fill")
                                .foregroundColor(.gray)
                                .font(.system(size: 20))
                        }
                        .padding(10)
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
                                    try await viewModel.resetPassword()
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
                                try await viewModel.signIn()
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
                        .padding(10)
                    }
                }
                .padding(10)
    
                Spacer()
                
                Divider()
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3) {
                        Text("Dont have an account?")
                        Text("Sign up")
                            .fontWeight(.bold)
                    }
                }
                .padding(.vertical, 16)
                .font(.footnote)
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
}
// MARK: - Preview
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
