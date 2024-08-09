//
//  HomeView.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 8.08.2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = container.resolve(HomeViewModel.self)!
    var body: some View {
        ZStack {
            Color("neroBlack", bundle: nil).ignoresSafeArea()
            ScrollView {
                Color.clear.ignoresSafeArea()
                VStack{
                    HomeWelcomeWidget(user: viewModel.user)
                    Spacer().frame(height: 20)
                    VStack(alignment: .leading) {
                        Text("Your Progress")
                            .font(.system(size: 14,weight: .semibold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity,alignment: .leading)

                    }
                    Spacer()
                }
            }.padding(.horizontal)
        }

    }
}

#Preview {
    HomeView()
}

struct HomeWelcomeWidget: View {
    var user: UserModel
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(Color(.vividOrange))
            Spacer()
                .frame(width: 10)
            Text("Merhaba \(user.name)")
                .font(.title2) // Use a custom font if needed
                .fontWeight(.medium)
                .foregroundColor(.white)

            Spacer() // This pushes the text to the leading side
        }
        .frame(maxWidth: .infinity)

    }
}
