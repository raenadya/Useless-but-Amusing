//
//  MapView.swift
//  Useless but Amusing
//
//  Created by Tristan Chay on 28/6/23.
//

import SwiftUI
import CoreLocation
import MapKit

struct Point: Codable, Identifiable, Equatable {
    static func == (lhs: Point, rhs: Point) -> Bool {
        return lhs.id == rhs.id && lhs.collectableButton == rhs.collectableButton
    }
    
    var id = UUID()
    var collectableButton: CollectableButton
    
    var coordinateLatitude: Double
    var coordinateLongitude: Double

    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: CLLocationDegrees(coordinateLatitude), longitude: coordinateLongitude)
    }
}

struct MapView: View {
    
    let pointsOnMapAtOnce = 5
    
    @State var tracking: MapUserTrackingMode = .follow
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 1.3521, longitude: 103.8198), span: MKCoordinateSpan(latitudeDelta: 135.68020269231502, longitudeDelta: 131.8359359933973))
    
    @State var mapPoints = [Point]()
    @ObservedObject var locationModel = LocationModel()
    
    var body: some View {
        Map(coordinateRegion: $region, interactionModes: MapInteractionModes.all, showsUserLocation: true, userTrackingMode: $tracking, annotationItems: mapPoints) { annotation in
            MapAnnotation(coordinate: annotation.coordinate) {
                MapAnnotationPoint(annotation: annotation, mapPoints: $mapPoints)
            }
        }
        .onAppear {
            locationModel.requestAuthorisation(always: false)
        }
        .onLoad {
            generateRandomPoints()
        }
    }
    
    func generateRandomPoints() {
        var i = 1
        
        while i <= 15 {
            let latitude = Double.random(in: -90...90)
            let longitude = Double.random(in: -180...180)
            
            mapPoints.append(Point(collectableButton: generateRandomCollectableButton(), coordinateLatitude: CLLocationDegrees(latitude), coordinateLongitude: CLLocationDegrees(longitude)))
            
            i += 1
        }
        
        print(mapPoints.count)
    }
    
    func generateRandomCollectableButton() -> CollectableButton {
        return CollectableButton(color: Color(red: Double.random(in: 0...255) / 255,
                                              green: Double.random(in: 0...255) / 255,
                                              blue: Double.random(in: 0...255) / 255),
                                 cornerRadius: Double.random(in: 0...100),
                                 scaleEffect: CGFloat(Double.random(in: 0.5...2)),
                                 offsetX: Double.random(in: -50...50),
                                 offsetY: Double.random(in: -50...50),
                                 rotationAngle: Double.random(in: -360...360),
                                 pictureName: "image-\(Int.random(in: 1...28))",
                                 title: generateRandomWord())
    }
    
    func generateRandomWord() -> String {
        let wordsArray = ["ben", "apples", "trunk", "charger", "joker", "lightning", "mush", "flora", "george", "gear", "rap", "snap", "ogre", "trackpad", "soup", "soda", "supercalifragilisticexpialidocious", "sandwich", "ceiling", "ginger", "garlic", "pen", "teacher", "pan", "kfc", "potato", "dog", "capacitor", "faith", "divider"]
        
        return wordsArray[Int.random(in: 0..<wordsArray.count)]
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
