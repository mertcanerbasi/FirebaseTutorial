//
//  ProfileView.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 8.08.2024.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = container.resolve(ProfileViewModel.self)!
    @Binding var showSingInView: Bool
    var body: some View {
        Button(action: {
            viewModel.signout()
            showSingInView = true
        }, label: {
            Text("Sign Out")
        })
    }
}

#Preview {
    ProfileView(showSingInView: .constant(true))
}
