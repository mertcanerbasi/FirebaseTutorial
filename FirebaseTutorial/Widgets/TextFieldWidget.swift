//
//  TextFieldWidget.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 9.08.2024.
//

import SwiftUI

struct TextFieldWidget: View {
    @Binding var text: String
    let keyboardType : UIKeyboardType
    let hintText: String
    var body: some View {
        ZStack(alignment: .leading) {
            // Background for the TextField
            Color.textfieldBg
                .cornerRadius(10)

            // TextField
            TextField("", text: $text)
                .font(.system(size: 14, weight: .regular))
                .keyboardType(keyboardType)
                .autocapitalization(.none)
                .autocorrectionDisabled()
                .foregroundColor(.white)
                .padding(10)
                .background(Color.clear)
                .cornerRadius(10)
                .tint(.vividOrange)

            // Custom placeholder
            if text.isEmpty {
                Text("\(hintText)") // Placeholder text
                    .font(.system(size: 12, weight: .light)) // Style for the placeholder
                    .foregroundColor(.white.opacity(0.7)) // Color for the placeholder
                    .padding(.leading, 15) // Padding to align with TextField text
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    TextFieldWidget(
        text: .constant(""), keyboardType: .emailAddress, hintText: "Emai")
}
