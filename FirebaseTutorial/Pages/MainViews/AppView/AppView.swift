//
//  BaseView.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 8.08.2024.
//

import SwiftUI

struct AppView: View {
    var body: some View {
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }

                WorkoutsView()
                    .tabItem {
                        Image(systemName: "dumbbell")
                        Text("Workouts")
                    }

                ProfileView(
                    )
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
                    }


            }
            .tint(.vividOrange)
    }
}

#Preview {
    AppView()
}
