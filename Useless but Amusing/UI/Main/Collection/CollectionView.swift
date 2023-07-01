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
        NavigationStack {
            List {
                ForEach(buttonManager.collectableButtons) { button in
                    NavigationLink(destination: CollectableButtonView(collectableButton: button)) {
                        Text(button.title)
                    }
                }
                .onDelete { indexSet in
                    buttonManager.collectableButtons.remove(atOffsets: indexSet)
                }
            }
            .navigationTitle("Button Collection")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
        }
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
    }
}
