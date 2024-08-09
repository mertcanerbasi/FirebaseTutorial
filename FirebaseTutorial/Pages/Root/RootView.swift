//
//  RootView.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 8.08.2024.
//

import SwiftUI

struct RootView: View {
    @StateObject var viewModel = container.resolve(RootViewModel.self)!
    var body: some View {
        ZStack {
            BaseView()
        }.onAppear {
            viewModel.isAuthenticated()
        }
        .fullScreenCover(isPresented: $viewModel.showSignInView, content: {
            NavigationStack {
                AuthenticationView()
            }.tint(.vividOrange)
        })
    }
}

#Preview {
    RootView()
}
