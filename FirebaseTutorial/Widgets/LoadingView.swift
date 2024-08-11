//
//  LoadingView.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 11.08.2024.
//

import SwiftUI
import WebKit

struct LoadingView: View {
    var body: some View {
        GIFImage(name: "loading") // load from assets
                .frame(width: 100,height: 100)
    }
}

#Preview {
    LoadingView()
}


