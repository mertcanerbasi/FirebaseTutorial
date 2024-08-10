//
//  SurveyView.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 10.08.2024.
//

import SwiftUI

struct SurveyView: View {
    var body: some View {
        ZStack {
            Image("bgImage")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)


            VStack {
                Image(systemName: "medal.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.vividOrange)
                    .frame(width: 200)
                Spacer().frame(height: 30)
                Text("Congralutations !")
                    .font(.system(size: 24,weight: .bold))
                    .foregroundColor(.white)
                Spacer().frame(height: 20)
                Text("Your registration in the app has been successfuly completed.")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 14,weight: .regular))
                    .foregroundColor(.white)
                Spacer().frame(height: 10)
                Text("To better understand your needs and goals, we invite you to complete a short survey.")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 14,weight: .regular))
                    .foregroundColor(.white)
                Spacer()
                NavigationLink {
                    NameSelectionView()
                } label: {
                    Text("Get Started")
                        .font(.system(size: 14,weight: .bold))
                        .foregroundColor(.white)
                        .padding(.vertical,10)
                        .padding(.horizontal,50)
                        .frame(maxWidth: .infinity)
                        .background(.vividOrange)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }


            }.padding(.horizontal,25)


        }.navigationTitle("Survey")
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    SurveyView()
}
