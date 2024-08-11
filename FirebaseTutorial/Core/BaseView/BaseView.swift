//
//  BaseView.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 11.08.2024.
//

import SwiftUI

struct BaseView<Content: View>: View {
    @ObservedObject var viewModel: BaseViewModel
    let content: () -> Content

    init(viewModel: BaseViewModel, @ViewBuilder content: @escaping () -> Content) {
        self.viewModel = viewModel
        self.content = content
    }

    var body: some View {
        ZStack {
            Color.neroBlack.ignoresSafeArea()

            content()
                .disabled(viewModel.isLoading) // Disable interactions when loading

            if viewModel.isLoading {
                LoadingView()
            }

            if viewModel.alert.isPresented {
                VStack {
                    Spacer()
                    Text(viewModel.alert.message)
                        .foregroundColor(.red)
                        .padding()
                        .background(Color.black.opacity(0.7))
                        .cornerRadius(8)
                    Spacer().frame(height: 20)
                }
                .transition(.slide)
                .animation(.easeInOut, value: viewModel.alert.isPresented )
            }
        }
    }
}
