//
//  ProfileTileWidget.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 9.08.2024.
//

import SwiftUI

struct ProfileTileWidget: View {
    let leadingIcon: String
    let title: String
    let subtitle: String?
    let onTap: (() -> Void)? // Closure parameter for the tap action

    var body: some View {
        VStack {
            HStack {
                Image(systemName: leadingIcon)
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 30, height: 30)
                    .background(
                        Color.vividOrange.frame(width: 35, height: 35)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                    )
                    .padding(.leading, 8)

                VStack(alignment: .leading, spacing: 5) {
                    Text(title)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.white)
                   subtitle != nil ? Text(subtitle!)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.white)
                    : nil
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 8)

                Spacer()

                Image(systemName: "chevron.right")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 15, height: 15)
                    .padding(.trailing, 8)
            }
        }
        .background(
            LinearGradient(colors: [.gradientStart, .gradientEnd], startPoint: .leading, endPoint: .trailing)
                .clipShape(RoundedRectangle(cornerRadius: 5))
        )
        .onTapGesture {
            onTap?() // Execute the passed closure when tapped
        }
    }
}

#Preview {
    ProfileTileWidget(
        leadingIcon: "tuningfork",
        title: "No Previous Data Available",
        subtitle: "Set your measurements and start tracking your progress",
        onTap: {
            print("Tile tapped!")
        }
    )
    .background(Color.black)
}
