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
        VStack {
            TextField("Email...", text: $viewModel.email)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .padding()
                .background(Color.gray.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 15))

            TextField("Password...", text: $viewModel.password)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .padding()
                .background(Color.gray.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 15))

            Button(action:  {

                viewModel.login() { res in
                    rootVm.isAuthenticated()
                }

            }, label: {
                Text("Login")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))

            })

            Spacer()




        }
        .padding(.horizontal,10)
        .padding(.vertical,15)
        .navigationTitle("Login with Email")
    }
}

#Preview {
    LoginView()
}
