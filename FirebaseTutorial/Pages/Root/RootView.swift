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
            BaseView(showSignInView: $viewModel.showSignInView)
        }.onAppear {
            viewModel.isAuthenticated() {
                res in
                viewModel.showSignInView = res
            }
        }
        .fullScreenCover(isPresented: $viewModel.showSignInView, content: {
            NavigationStack {
                AuthenticationView(showSignInView: $viewModel.showSignInView)
            }.tint(.vividOrange)
        })
    }
}

#Preview {
    RootView()
}
