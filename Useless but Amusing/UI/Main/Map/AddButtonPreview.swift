//
//  AddButtonPreview.swift
//  Useless but Amusing
//
//  Created by Tristan Chay on 28/6/23.
//

import SwiftUI

struct AddButtonPreview: View {
    
    @State var annotation: Point
    @Binding var mapPoints: [Point]
    
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var buttonManager: CollectableButtonManager = .shared
    
    let notificationGenerator = UINotificationFeedbackGenerator()
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Spacer()
                CollectableButtonView(collectableButton: annotation.collectableButton)
                Spacer()
                
                Button {
                    buttonManager.collectableButtons.insert(annotation.collectableButton, at: 0)
                    removeMapPoint(mapPoint: annotation)
                    dismiss.callAsFunction()
                    
                    notificationGenerator.notificationOccurred(.success)
                } label: {
                    Text("Add to Collection")
                        .padding()
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(width: (UIScreen.main.bounds.width - 30))
                        .frame(height: 60)
                        .background(.blue)
                        .cornerRadius(16)
                }
                .padding(.bottom)
            }
            .navigationTitle(annotation.collectableButton.title)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func removeMapPoint(mapPoint: Point) {
        var i = 0
        var index = Int()
        
        mapPoints.forEach { mapPointIteration in
            if mapPointIteration == mapPoint {
                index = i
            } else {
                i += 1
            }
        }
        
        mapPoints.remove(at: index)
    }
}

struct AddButtonPreview_Previews: PreviewProvider {
    static var previews: some View {
        Text("AddButtonPreview()")
    }
}
