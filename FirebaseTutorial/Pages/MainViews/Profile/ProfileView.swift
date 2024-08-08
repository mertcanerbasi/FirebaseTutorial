//
//  ProfileView.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 8.08.2024.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = container.resolve(ProfileViewModel.self)!
    var body: some View {
        Button(action: {
            viewModel.signout()
        }, label: {
            Text("Sign Out")
        })
    }
}

#Preview {
    ProfileView()
}
