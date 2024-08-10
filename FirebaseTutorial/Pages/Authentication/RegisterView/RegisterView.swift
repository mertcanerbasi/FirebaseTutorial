//
//  RegisterView.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 9.08.2024.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel: RegisterViewModel = container.resolve(RegisterViewModel.self)!
    @ObservedObject var rootVm = container.resolve(RootViewModel.self)!
    var body: some View {
        ScrollView {
            VStack {
                Text("Create an account")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(.white)
                Spacer().frame(height: 20)
                TextFieldWidget(text: $viewModel.email, keyboardType: .emailAddress, hintText: "Email")
                Spacer().frame(height: 20)
                TextFieldWidget(text: $viewModel.password, keyboardType: .default, hintText: "Password")
                Spacer().frame(height: 20)
                TextFieldWidget(text: $viewModel.passwordAgain, keyboardType: .default, hintText: "Password Again")
                Spacer().frame(height: 50)
                SignupButton {
                    viewModel.registerWithEmailAndPassword(){
                        rootVm.setRootCase()
                    }
                }
            }
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 15)
        .background(
            Color.neroBlack.ignoresSafeArea()
        )
        .alert(isPresented: $viewModel.alert.isPresented) {
            Alert(
                title: Text(viewModel.alert.alertTitle),
                message: Text(viewModel.alert.alertDesc),
                dismissButton: .default(Text("OK")) {
                    // Optionally reset the view model or perform additional actions
                    viewModel.email = ""
                    viewModel.password = ""
                    viewModel.passwordAgain = ""
                }
            )
        }
    }
}

#Preview {
    RegisterView()
}

struct SignupButton: View {
    let onTap: () -> Void

    var body: some View {
        HStack {
            Spacer()
            Text("Sign Up")
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
