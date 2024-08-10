//
//  AnimatedCircularButton.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 10.08.2024.
//

import SwiftUI

struct AnimatedCircularButton: View {
    let size: CGFloat
    let onComplete: () -> Void

    @State private var isPressed = false
    @State private var scale: CGFloat = 0.5
    @State private var fillOpacity: Double = 0.0

    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(Color.vividOrange, lineWidth: 2)
                .background(
                    Circle()
                        .fill(Color.vividOrange.opacity(isPressed ? fillOpacity : 0))
                )
                .frame(width: size * scale, height: size * scale)
                .animation(.easeInOut(duration: 2), value: scale)
                .animation(.easeInOut(duration: 2), value: fillOpacity)

            Circle()
                .fill(Color.vividOrange)
                .frame(width: size / 2, height: size / 2)
        }
        .gesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in
                    isPressed = true
                    withAnimation(.easeIn(duration: 2)) {
                        scale = 1.0
                        fillOpacity = 1.0
                    }
                }
                .onEnded { _ in
                    isPressed = false
                    withAnimation(.easeIn(duration: 2)) {
                        scale = 0.5
                        fillOpacity = 0.0
                    }
                    // Complete action when animation ends
                    onComplete()
                }
        )
        .onAppear {
            // Set the initial scale and fillOpacity values
            scale = 0.5
            fillOpacity = 0.0
        }
    }
}



#Preview {
    AnimatedCircularButton(size: 100) {

    }
}
