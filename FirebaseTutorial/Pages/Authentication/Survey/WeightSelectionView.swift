//
//  WeightSelectionView.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 10.08.2024.
//

import SwiftUI

struct WeightSelectionView: View {
    var registerModel: RegisterUserModel = RegisterUserModel.shared
    @State private var selectedWeight: Int = 70
    var body: some View {
        VStack {
            Text("How much do you weigh?")
                .multilineTextAlignment(.center)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
            Spacer()
            Picker(selection: $selectedWeight, label: Text("")) {
                            ForEach(30...250, id: \.self) { weight in
                                Text("\(weight)")
                                    .font(.system(size: 24, weight: .semibold))
                                    .foregroundColor(.white)
                                    .tag(weight)
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .frame(height: 200)
                        .onChange(of: selectedWeight) { oldValue,newValue in
                            registerModel.weight = newValue
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
    WeightSelectionView()
}
