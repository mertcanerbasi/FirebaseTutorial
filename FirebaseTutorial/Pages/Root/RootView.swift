//
//  RootView.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 8.08.2024.
//

import SwiftUI

struct RootView: View {
    @StateObject var viewModel = container.resolve(RootViewModel.self)!
    @State private var showSignInView: Bool = true
    var body: some View {
        ZStack {
            BaseView(showSignInView: $showSignInView)
        }.onAppear {
            viewModel.isAuthenticated() {
                res in
                showSignInView = res
            }
        }
        .fullScreenCover(isPresented: $showSignInView, content: {
            NavigationStack {
                AuthenticationView(showSignInView: $showSignInView)
            }
        })
    }
}

#Preview {
    RootView()
}
