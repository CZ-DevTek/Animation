//
//  ContentView.swift
//  Animation
//
//  Created by Carlos Garcia Perez on 6/5/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isButtonPressed = false
    @State private var shakeAngle: Angle = .zero
    
    var body: some View {
        
        VStack {
            DogView(isButtonPressed: $isButtonPressed)
            
            // MARK: Sausage
            if isButtonPressed {
                Capsule()
                    .frame(width: 250, height: 55)
                    .scaleEffect(CGSize(width: 0.6, height: 0.7))
                    .foregroundColor(.orange)
                    .scaleEffect(CGSize(width: 0.6, height: 0.7))
                    .rotationEffect(shakeAngle)
                    .animation(.easeInOut(duration: 0.3), value: isButtonPressed)
            }
            
            Button(action: {
                withAnimation {
                    isButtonPressed.toggle()
                    triggerShake()
                }
            }) {
                Capsule()
                    .fill(Color.blue)
                    .frame(width: 200, height: 50)
                    .overlay(
                        Text("Feed Me")
                            .foregroundColor(.white)
                    )
            }
            
            Spacer().frame(height: 20)
            
        }
    }
    private func triggerShake() {
        withAnimation(Animation.easeInOut(duration: 0.1).repeatCount(10, autoreverses: true)) {
            shakeAngle = Angle(degrees: 50)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            shakeAngle = .zero
            isButtonPressed = false
        }
    }
}

#Preview {
    ContentView()
}
