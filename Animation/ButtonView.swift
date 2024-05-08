//
//  ButtonView.swift
//  Animation
//
//  Created by Carlos Garcia Perez on 8/5/24.
//

import SwiftUI

struct ButtonView: View {
    @Binding var isButtonPressed: Bool
    var triggerShake: () -> Void

    var body: some View {
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
    }
}

