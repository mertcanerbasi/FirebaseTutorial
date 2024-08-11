//
//  PromiseView.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 10.08.2024.
//

import SwiftUI

struct PromiseView: View {
    var registerModel: RegisterUserModel = RegisterUserModel.shared
    @StateObject var viewModel = container.resolve(PromiseViewModel.self)!
    @ObservedObject var rootVm = container.resolve(RootViewModel.self)!
    var body: some View {
        VStack {
            Text("Your Commitment")
                .multilineTextAlignment(.center)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
            Spacer().frame(height: 25)
            HStack {
                Text("I have decided to")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.vividOrange)
                Text("get in shape and stay fit")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.white)
            }
            Spacer().frame(height: 25)
            Text("I will work consistently to achieve my goals. I will be patient with myself and my growth.")
                .multilineTextAlignment(.center)
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(.white)
            Spacer()
            VStack {
                AnimatedCircularButton(size: 100) {
                    viewModel.saveUserInfo(registerUserModel: registerModel) {
                        rootVm.setRootCase()
                    }


                }
                Spacer().frame(height: 20)
                Text("Press and hold the button to continue")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.white)

            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal,20)
        .padding(.vertical,30)
        .background(
            Color.neroBlack.ignoresSafeArea()
        ).alert(isPresented: $viewModel.alert.isPresented) {
            Alert(
                title: Text(viewModel.alert.alertTitle),
                message: Text(viewModel.alert.alertDesc),
                dismissButton: .default(Text("OK")) {
                }
            )
        }
    }
}

#Preview {
    PromiseView()
}
