//
//  HomeWelcomeWidget.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 9.08.2024.
//

import SwiftUI

struct HomeWelcomeWidget: View {
    var user: UserModel?
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(Color(.vividOrange))
            Spacer()
                .frame(width: 10)
            Text("Merhaba \(user?.name ?? "")")
                .font(.title2) // Use a custom font if needed
                .fontWeight(.medium)
                .foregroundColor(.white)

            Spacer() // This pushes the text to the leading side
        }
        .frame(maxWidth: .infinity)

    }
}

#Preview {
    HomeWelcomeWidget(user: UserModel(name: "Mertcan", age: 26, gender: .male, height: 183, weight: 85, isPremium: false, language: .english, notificationsEnabled: true))
}
