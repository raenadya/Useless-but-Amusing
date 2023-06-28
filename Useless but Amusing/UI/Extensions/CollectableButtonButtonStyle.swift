//
//  CollectableButtonButtonStyle.swift
//  Useless but Amusing
//
//  Created by Tristan Chay on 28/6/23.
//

import SwiftUI

struct CollectableButtonButtonStyle: ButtonStyle {
    
    @State var backgroundColor: Color
    
    @State var scaleEffect: CGFloat
    
    @State var cornerRadius: CGFloat
    
    @State var offsetX: CGFloat
    @State var offsetY: CGFloat
    
    @State var rotationAngle: Double
    
    let impactMed = UIImpactFeedbackGenerator(style: .medium)
    
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding()
                .background(backgroundColor)
                .cornerRadius(cornerRadius)
                .scaleEffect(configuration.isPressed ? scaleEffect : 1)
                .offset(x: configuration.isPressed ? offsetX : 1, y: configuration.isPressed ? offsetY : 1)
                .rotationEffect(configuration.isPressed ? Angle(degrees: rotationAngle) : Angle(degrees: 0))
                .animation(.spring(), value: configuration.isPressed)
                .onChange(of: configuration.isPressed) { _ in
                    impactMed.impactOccurred()
                }
    }
}
