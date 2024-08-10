//
//  GenderSelectionView.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 10.08.2024.
//

import SwiftUI

struct GenderSelectionView: View {
    @State var selectedGender : Gender = .female

    var body: some View {
        VStack {
            Text("Choose your gender")
                .multilineTextAlignment(.center)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
            Spacer().frame(height: 20)
            GenderSelectionTile(gender: "Female",selected: $selectedGender)
            Spacer().frame(height: 20)
            GenderSelectionTile(gender: "Male",selected: $selectedGender)
            Spacer().frame(height: 20)
            GenderSelectionTile(gender: "Other",selected: $selectedGender)
            Spacer()
            NavigationLink(destination: AgeSelectionView()) {
                Text("Continue")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.royalBlue)
                    .padding()
            }

        }.padding(.horizontal,20)
        .background(
            Color.neroBlack.ignoresSafeArea()
        )
    }
}

#Preview {
    GenderSelectionView()
}

struct GenderSelectionTile: View {
    let gender: String
    @Binding var selected: Gender
    var registerModel: RegisterUserModel = RegisterUserModel.shared
    var body: some View {
        HStack {
            Text(gender)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(gender == selected.rawValue.capitalized ? .vividOrange : .white)
            Spacer()
            Image(gender)
                .resizable()
                .scaledToFit()
                .frame(width:40,height:40)
        }
        .padding(.horizontal,20)
        .padding(.vertical,10)
        .onTapGesture {
            if gender == "Female" {
                selected = .female
                registerModel.gender = .female
            }
            else if gender == "Male" {
                selected = .male
                registerModel.gender = .male
            }
            else {
                selected = .other
                registerModel.gender = .other
            }
        }
        .background(
            Color.textfieldBg
        )
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
