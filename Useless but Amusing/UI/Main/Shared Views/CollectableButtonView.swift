//
//  CollectableButtonView.swift
//  Useless but Amusing
//
//  Created by Tristan Chay on 28/6/23.
//

import SwiftUI

struct CollectableButtonView: View {
    
    @State var collectableButton: CollectableButton
    
    var body: some View {
        VStack {
            Button {
                
            } label: {
                Image(collectableButton.pictureName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width * 3/4, height: UIScreen.main.bounds.height * 1/3)
                    .cornerRadius(collectableButton.cornerRadius)
            }
            .buttonStyle(CollectableButtonButtonStyle(backgroundColor: collectableButton.color,
                                                      scaleEffect: collectableButton.scaleEffect,
                                                      cornerRadius: collectableButton.cornerRadius,
                                                      offsetX: collectableButton.offsetX,
                                                      offsetY: collectableButton.offsetY,
                                                      rotationAngle: collectableButton.rotationAngle))
        }
    }
}

struct CollectableButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Text("CollectableButtonView()")
    }
}
