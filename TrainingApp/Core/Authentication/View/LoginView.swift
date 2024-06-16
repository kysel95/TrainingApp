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
                    }
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .modifier(TextFieldModifier())
                    
                    HStack {
                        if isPasswordVisible {
                            TextField("Password", text: $viewModel.password)
                        } else {
                            SecureField("Password", text: $viewModel.password)
                        }
                        
                        Button {
                            isPasswordVisible.toggle()
                        } label: {
                            Image(systemName: isPasswordVisible ? "eye.fill" : "eye.slash.fill")
                                .foregroundColor(.gray)
                        }
                        .alignmentGuide(.trailing) { $0[.trailing] }
                    }
                    .modifier(TextFieldModifier())
                    
                    HStack{
                        Button{
                            Task{
                                do{
                                    try await viewModel.resetPassword()
                                }
                            }
                        } label : {
                            Text("Forgot Password?")
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .padding(.vertical,5)
                                .foregroundColor(.white)

                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    Button {
                        Task{
                            do{
                                try await viewModel.signIn()
                            }
                        }
                    } label: {
                        HStack {
                            Text("SIGN IN")
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
                .foregroundColor(.white)
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
}
// MARK: - Preview
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
