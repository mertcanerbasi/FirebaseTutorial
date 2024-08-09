//
//  AuthenticationView.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 8.08.2024.
//

import SwiftUI

struct AuthenticationView: View {
    @Binding var showSignInView: Bool
    var body: some View {
        VStack {
            NavigationLink {
                SignInWithEmail(showSignInView: $showSignInView)
            } label: {
                Text("Sign in With Email")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            NavigationLink {
                LoginView(showSignInView: $showSignInView)
            } label: {
                Text("Login With Email")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }

            Spacer()

        }
        .padding(.horizontal,10)
        .padding(.vertical,15)
        .navigationTitle("Sign In")
    }
}

#Preview {
    NavigationStack {
        AuthenticationView(showSignInView: .constant(true))
    }

}
