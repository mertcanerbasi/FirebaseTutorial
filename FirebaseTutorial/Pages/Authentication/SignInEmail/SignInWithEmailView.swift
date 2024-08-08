//
//  SignInWithEmail.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 8.08.2024.
//

import SwiftUI

struct SignInWithEmail: View {
    @StateObject private var viewModel = container.resolve(SignInEmailViewModel.self)!

    var body: some View {
        VStack {
            TextField("Email...", text: $viewModel.email)
                .padding()
                .background(Color.gray.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 15))

            TextField("Password...", text: $viewModel.password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 15))

            Button(action:  {

                  viewModel.signIn()

            }, label: {
                Text("Sign in")
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
        .navigationTitle("Sign In With Email")
    }
}

#Preview {
    NavigationStack {
        SignInWithEmail()
    }
}
