//
//  DogView.swift
//  Animation
//
//  Created by Carlos Garcia Perez on 8/5/24.
//

import SwiftUI
struct DogView: View {
    let isButtonPressed: Bool
    
    var body: some View {
            
            VStack {
                GeometryReader { geometry in
                    let width = geometry.size.width
                    let height = geometry.size.height
                    let size = min(width, height)
                    let big = size / 1.5
                    let middle = size / 2
                    let small = size / 5
                    let nearLine = size * 0.1
                    let farLine = size * 0.9
                // Head
                Path { path in
                    path.move(to: CGPoint(x: middle, y: nearLine))
                    path.addQuadCurve(
                        to: CGPoint(x: farLine, y: middle),
                        control: CGPoint(x: 340, y: 0)
                    )
                    path.addQuadCurve(
                        to: CGPoint(x: middle, y: 350),
                        control: CGPoint(x: 430, y: 400)
                    )
                    path.addQuadCurve(
                        to: CGPoint(x: nearLine, y: middle),
                        control: CGPoint(x: -40, y: 400)
                    )
                    path.addQuadCurve(
                        to: CGPoint(x: middle, y: nearLine),
                        control: CGPoint(x: 60, y: 0)
                    )
                }
                .fill(
                    LinearGradient(gradient: Gradient(colors: [Color.white, Color.gray]), startPoint: .top, endPoint: .bottom)
                )
                //Tongue
                Capsule()
                    .frame(width: 150, height: isButtonPressed ? 250 : 100)
                    .scaleEffect(CGSize(width: 0.6, height: 0.7))
                    .offset(x: 120, y: 230)
                    .foregroundStyle(.red)
                    .animation(.easeInOut(duration: 0.3), value: isButtonPressed)
                
                // Morda
                Path { path in
                    path.addArc(
                        center: CGPoint(x: 275, y: 290),
                        radius: small,
                        startAngle: .degrees(170),
                        endAngle: .degrees(320),
                        clockwise: true
                    )
                    path.addArc(
                        center: CGPoint(x: 505, y: 30),
                        radius: big,
                        startAngle: .degrees(140),
                        endAngle: .degrees(180),
                        clockwise: false
                    )
                    path.addArc(
                        center: CGPoint(x: -110, y: 30),
                        radius: big,
                        startAngle: .degrees(0),
                        endAngle: .degrees(40),
                        clockwise: false
                    )
                    
                    path.addArc(
                        center: CGPoint(x: 118, y: 290),
                        radius: small,
                        startAngle: .degrees(215),
                        endAngle: .degrees(10),
                        clockwise: true
                    )
                    path.closeSubpath()
                }
                .fill(Color.white)
                .stroke(Color.black)
                
                // left eard
                Path { path in
                    
                    path.addArc(
                        center: CGPoint(x: -80, y: 35),
                        radius: middle,
                        startAngle: .degrees(280),
                        endAngle: .degrees(0),
                        clockwise: false
                    )
                    
                    path.addArc(
                        center: CGPoint(x: 138, y: 115),
                        radius: middle / 2.5,
                        startAngle: .degrees(270),
                        endAngle: .degrees(200),
                        clockwise: true
                    )
                    path.addArc(
                        center: CGPoint(x: 20, y: 95),
                        radius: small / 2,
                        startAngle: .degrees(20),
                        endAngle: .degrees(180),
                        clockwise: false
                    )
                    path.addArc(
                        center: CGPoint(x: -300, y: 50),
                        radius: big,
                        startAngle: .degrees(0),
                        endAngle: .degrees(340),
                        clockwise: true
                    )
                    path.addArc(
                        center: CGPoint(x: 30, y: -95),
                        radius: middle / 2,
                        startAngle: .degrees(150),
                        endAngle: .degrees(220),
                        clockwise: false
                    )
                    path.closeSubpath()
                }
                .fill(Color.black)
                
                // right eard
                let originalPath = Path { path in
                    path.addArc(
                        center: CGPoint(x: -80, y: 35),
                        radius: middle,
                        startAngle: .degrees(280),
                        endAngle: .degrees(0),
                        clockwise: false
                    )
                    
                    path.addArc(
                        center: CGPoint(x: 138, y: 115),
                        radius: middle / 2.5,
                        startAngle: .degrees(270),
                        endAngle: .degrees(200),
                        clockwise: true
                    )
                    path.addArc(
                        center: CGPoint(x: 20, y: 95),
                        radius: small / 2,
                        startAngle: .degrees(20),
                        endAngle: .degrees(180),
                        clockwise: false
                    )
                    path.addArc(
                        center: CGPoint(x: -300, y: 50),
                        radius: big,
                        startAngle: .degrees(0),
                        endAngle: .degrees(340),
                        clockwise: true
                    )
                    path.addArc(
                        center: CGPoint(x: 30, y: -95),
                        radius: middle / 2,
                        startAngle: .degrees(150),
                        endAngle: .degrees(220),
                        clockwise: false
                    )
                    path.closeSubpath()
                }
                
                let transform = CGAffineTransform(scaleX: -1, y: 1)
                    .concatenating(CGAffineTransform(translationX: 390, y: 0))
                
                originalPath
                    .applying(transform)
                    .fill(Color.black)
                
                // line nose-mouth
                Path { path in
                    path.move(to: CGPoint(x: middle, y: 230))
                    path.addLine(to: CGPoint(x: middle, y: 305))
                }
                .stroke(
                    Color.black)
                //Nose
                Capsule()
                    .frame(width: 150, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .scaleEffect(CGSize(width: 0.6, height: 0.7))
                    .offset(x: 125, y: 150)
                // eyes
                Circle()
                    .frame(height: 45)
                    .offset(x: 65, y: 130)
                Circle()
                    .frame(height: 45)
                    .offset(x: 285, y: 130)
            }
            .scaleEffect(0.7)
            .offset(y:100)
        }
    }
}

#Preview {
    DogView(isButtonPressed: false)
}
