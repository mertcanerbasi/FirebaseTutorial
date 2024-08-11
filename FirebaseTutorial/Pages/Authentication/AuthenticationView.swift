//
//  AuthenticationView.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 8.08.2024.
//

import SwiftUI

struct AuthenticationView: View {
    var body: some View {
        ZStack {
            Image("bgImage")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Text("Welcome To GymPol")
                    .font(.system(size: 24,weight: .semibold))
                    .foregroundColor(.white)
                Spacer().frame(height: 5)
                Text("Your personal sport assistant")
                    .font(.system(size: 14,weight: .regular))
                    .foregroundColor(.white)
                Spacer().frame(height: 20)
                NavigationLink {
                    RegisterView()

                } label: {
                    Text("Get Started")
                        .font(.system(size: 14,weight: .bold))
                        .foregroundColor(.white)
                        .padding(.vertical,10)
                        .padding(.horizontal,50)
                        .frame(maxWidth: .infinity)
                        .background(.vividOrange)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                Spacer().frame(height: 20)
                NavigationLink {
                    LoginView()
                } label: {
                    Text("Already have account ?")
                        .font(.system(size: 14,weight: .bold))
                        .foregroundColor(.white)

                }



            }
            .padding(.horizontal, 20)
            .padding(.vertical,20)


        }

    }
}

#Preview {
    NavigationStack {
        AuthenticationView()
    }

}
