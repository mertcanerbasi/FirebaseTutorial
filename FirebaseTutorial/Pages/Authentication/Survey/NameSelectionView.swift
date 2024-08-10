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
    @State var navigateToNextPage: Bool = false

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
            NavigationLink(
                destination: GenderSelectionView(), // Replace with your destination view
                isActive: $navigateToNextPage,
                label: {
                    Button(action: {
                        if isButtonEnabled {
                            registerModel.name = name
                            navigateToNextPage = true // Trigger navigation
                        }
                    }, label: {
                        Text("Continue")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(isButtonEnabled ? .royalBlue : .gray) // Change color based on button state
                    })
                    .disabled(!isButtonEnabled) // Disable button if not enabled
                }
            )// Disable button if not enabled
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
