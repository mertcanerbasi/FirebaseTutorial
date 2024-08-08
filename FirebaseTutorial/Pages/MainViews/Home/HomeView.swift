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
        ScrollView {
            VStack{
                HStack {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color(.red))
                    // Use your custom color

                    Text("Merhaba Mertcan")
                        .font(.title2) // Use a custom font if needed
                        .fontWeight(.medium)

                    Spacer() // This pushes the text to the leading side
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal)

                Spacer().frame(height: 20)
                Spacer()
            }
        }

    }
}

#Preview {
    HomeView()
}
