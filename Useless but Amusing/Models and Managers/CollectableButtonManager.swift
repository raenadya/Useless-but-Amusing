//
//  CollectableButtonManager.swift
//  Useless but Amusing
//
//  Created by Tristan Chay on 28/6/23.
//

import Foundation
import SwiftUI

struct CollectableButton: Codable, Identifiable, Equatable {
    var id = UUID()
    
    var color: Color
    
    var cornerRadius: CGFloat
    
    var scaleEffect: CGFloat
    
    var offsetX: CGFloat
    var offsetY: CGFloat
    
    var rotationAngle: Double
    
    var pictureName: String
    
    var title: String
}

class CollectableButtonManager: ObservableObject {
    static let shared: CollectableButtonManager = .init()
    
    @Published var collectableButtons: [CollectableButton] = [] {
        didSet {
            save()
        }
    }
        
    init() {
        load()
    }
    
    func getArchiveURL() -> URL {
        let plistName = "collectableButtons.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedCollectableButtons = try? propertyListEncoder.encode(collectableButtons)
        try? encodedCollectableButtons?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
                
        if let retrievedCollectableButtonData = try? Data(contentsOf: archiveURL),
            let collectableButtonDecoded = try? propertyListDecoder.decode([CollectableButton].self, from: retrievedCollectableButtonData) {
            collectableButtons = collectableButtonDecoded
        }
    }
}
