//
//  mapAnnotationPoint.swift
//  Useless but Amusing
//
//  Created by Tristan Chay on 28/6/23.
//

import SwiftUI

struct MapAnnotationPoint: View {
    
    @State var annotation: Point
    @State var showingPreview = false
    
    @Binding var mapPoints: [Point]
    
    var body: some View {
        VStack {
            Image(systemName: "button.programmable")
                .padding(5)
                .foregroundColor(annotation.collectableButton.color)
                .background(.primary)
                .clipShape(Circle())
        }
        .onTapGesture {
            showingPreview.toggle()
        }
        .sheet(isPresented: $showingPreview) {
            AddButtonPreview(annotation: annotation, mapPoints: $mapPoints)
                .presentationDetents([.medium])
        }
    }
}

struct mapCollectable_Previews: PreviewProvider {
    static var previews: some View {
        Text("mapCollectable()")
    }
}
