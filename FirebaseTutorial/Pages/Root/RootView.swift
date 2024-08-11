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
            switch viewModel.rootCase {
                case .notLoggedIn:
                    NavigationStack {
                        AuthenticationView()
                    }
                    .tint(.vividOrange)
                case .survey:
                    NavigationStack {
                        SurveyView()
                    }
                    .tint(.vividOrange)
                case .loggedIn:
                    AppView()
            }
            }
            .onAppear {
                viewModel.setRootCase()
            }
    }
}

#Preview {
    RootView()
}
