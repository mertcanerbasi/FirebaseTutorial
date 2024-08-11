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
        BaseView(viewModel: viewModel) {
            ScrollView {
                VStack{
                    HomeWelcomeWidget(user: viewModel.user)
                    Spacer().frame(height: 20)
                    ProgressWidget()
                    Spacer()
                }
            }.padding(.horizontal)
                .onAppear {
                    Task {
                        await viewModel.getAllData()
                    }
                }
        }
    }
}

#Preview {
    HomeView()
}




