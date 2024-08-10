//
//  ProfileView.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 8.08.2024.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = container.resolve(ProfileViewModel.self)!

    @ObservedObject var rootVm = container.resolve(RootViewModel.self)!

    var body: some View {
        Button(action: {
            viewModel.signout()
            rootVm.setRootCase()
        }, label: {
            Text("Sign Out")
        })
    }
}

#Preview {
    ProfileView()
}
