//
//  CollectionView.swift
//  Useless but Amusing
//
//  Created by Tristan Chay on 28/6/23.
//

import SwiftUI

struct CollectionView: View {
    @ObservedObject var buttonManager: CollectableButtonManager = .shared
    
    var body: some View {
        NavigationView {
            List(buttonManager.collectableButtons) { button in
                NavigationLink(destination: CollectableButtonView(collectableButton: button)) {
                    Text("button")
                }
            }
            .navigationTitle("Button Collection")
        }
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
    }
}
