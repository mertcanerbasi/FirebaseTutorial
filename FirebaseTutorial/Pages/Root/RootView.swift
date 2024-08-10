//
//  RootView.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 8.08.2024.
//

import SwiftUI

struct RootView: View {
    @StateObject var viewModel: RootViewModel = container.resolve(RootViewModel.self)!


    var body: some View {
        Group {
                if viewModel.showSignInView {
                    NavigationStack {
                        AuthenticationView()
                    }
                    .tint(.vividOrange)
                } else {
                    BaseView()
                }
            }
            .onAppear {
                viewModel.isAuthenticated()
            }
    }
}

#Preview {
    RootView()
}
