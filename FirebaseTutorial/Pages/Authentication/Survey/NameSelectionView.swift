//
//  NameSelectionView.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 10.08.2024.
//

import SwiftUI

struct NameSelectionView: View {
    var registerModel: RegisterUserModel = RegisterUserModel.shared
    @State var name: String = ""
    @State var isButtonEnabled: Bool = false

    var body: some View {
        VStack {
            Text("What's your name?")
                .multilineTextAlignment(.center)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
            Spacer()
            TextFieldWidget(text: $name, keyboardType: .alphabet, hintText: "Your name")
                .frame(height: 60)
                .onChange(of: name) { oldValue,newValue in
                    // Update isButtonEnabled based on the length of the name
                    isButtonEnabled = newValue.count > 2
                }
            Spacer()
            if isButtonEnabled {
                NavigationLink(destination: GenderSelectionView()) {
                    Text("Continue")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.royalBlue)
                        .padding()
                }
            } else {
                // Button with a disabled appearance
                Text("Continue")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.gray)
                    .padding() // Optional padding for consistency
                    .opacity(0.5)
            }

            Spacer().frame(height: 20)
        }
        .background(
            Color.neroBlack.ignoresSafeArea()
        )
    }
}

#Preview {
    NameSelectionView()
}
