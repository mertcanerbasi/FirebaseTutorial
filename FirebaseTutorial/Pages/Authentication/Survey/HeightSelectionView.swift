//
//  HeightSelectionView.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 10.08.2024.
//

import SwiftUI

struct HeightSelectionView: View {
    var registerModel: RegisterUserModel = RegisterUserModel.shared
    @State private var selectedHeight: Int = 175
    var body: some View {
        VStack {
            Text("How tall are you?")
                .multilineTextAlignment(.center)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
            Spacer()
            Picker(selection: $selectedHeight, label: Text("")) {
                            ForEach(140...250, id: \.self) { height in
                                Text("\(height)")
                                    .font(.system(size: 24, weight: .semibold))
                                    .foregroundColor(.white)
                                    .tag(height)
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .frame(height: 200)
                        .onChange(of: selectedHeight) { oldValue,newValue in
                            registerModel.height = newValue
                        }
            Spacer()
            NavigationLink(destination: WeightSelectionView()) {
                Text("Continue")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.royalBlue)
                    .padding()
            }
        }
        .frame(maxWidth: .infinity)
        .background(
            Color.neroBlack.ignoresSafeArea()
        )
    }
}

#Preview {
    HeightSelectionView()
}
