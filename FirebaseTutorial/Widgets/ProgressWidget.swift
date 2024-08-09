//
//  ProgressWidget.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 9.08.2024.
//

import SwiftUI

struct ProgressWidget: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Your Progress")
                .font(.system(size: 14,weight: .semibold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity,alignment: .leading)
            Spacer()
                .frame(height: 10)
            ProfileTileWidget(leadingIcon: "tuningfork", title: "No Previous Data Available", subtitle: "Set your measurements and start tracking your progress", onTap: {
                print("Tile Tapped")
            }


            )

        }
    }
}
#Preview {
    ProgressWidget().background(.neroBlack)
}
