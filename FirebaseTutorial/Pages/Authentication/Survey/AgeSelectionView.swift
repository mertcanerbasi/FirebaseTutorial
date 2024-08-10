//
//  AgeSelectionView.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 10.08.2024.
//

import SwiftUI

struct AgeSelectionView: View {
    var registerModel: RegisterUserModel = RegisterUserModel.shared
    @State private var selectedAge: Int = 25
    var body: some View {
        VStack {
            Text("Choose your gender")
                .multilineTextAlignment(.center)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
            Spacer()
            Picker(selection: $selectedAge, label: Text("")) {
                            ForEach(18...100, id: \.self) { age in
                                Text("\(age)")
                                    .font(.system(size: 24, weight: .semibold))
                                    .foregroundColor(.white)
                                    .tag(age)
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .frame(height: 200)
                        .onChange(of: selectedAge) { oldValue,newValue in
                            registerModel.age = newValue
                        }
            Spacer()
            NavigationLink(destination: AgeSelectionView()) {
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
    AgeSelectionView()
}
