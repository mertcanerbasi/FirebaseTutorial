//
//  LoginView.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 9.08.2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel: LoginViewModel = container.resolve(LoginViewModel.self)!
    @ObservedObject var rootVm: RootViewModel = container.resolve(RootViewModel.self)!
    var body: some View {
        BaseView(viewModel: viewModel) {
            ScrollView {
                VStack {
                    Text("Welcome Back!")
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundColor(.white)
                    Spacer().frame(height: 20)
                    TextFieldWidget(text: $viewModel.email, keyboardType: .emailAddress, hintText: "Email")
                    Spacer().frame(height: 20)
                    TextFieldWidget(text: $viewModel.password, keyboardType: .default, hintText: "Password")
                    Spacer().frame(height: 5)
                    Button {

                    } label: {
                        Text("Forgot Password?")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(.vividOrange)
                    }

                    Spacer().frame(height: 50)
                    LoginButton {
                        viewModel.login {
                            rootVm.setRootCase()
                        }
                    }

                }
            }
        }



    }
}

#Preview {
    LoginView()
}


struct LoginButton: View {
    let onTap: () -> Void

    var body: some View {
        HStack {
            Spacer()
            Text("Login")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Spacer().frame(width: 15)
            Circle()
                .fill(
                    .vividOrange
                )
                .frame(width: 35, height: 35)
                .overlay {
                    Image(systemName: "arrow.forward")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 20, height: 20)
                }
        }
        .padding(.trailing, 20)
        .onTapGesture {
            onTap()
        }
    }
}
