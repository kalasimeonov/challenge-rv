//
//  RVMapLocation.swift
//  RVFinder
//
//  Created by Evelina Zaneva on 23.09.23.
//

import MapKit
import SwiftUI

private extension RVMapLocation {
    enum Constants {
        static let size = 20.0
    }
}
struct MapLocation: Identifiable {
    let id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
}
struct RVMapLocation: View {
    
    let place: MapLocation
    @State var region: MKCoordinateRegion
    
    var body: some View {
        Map(coordinateRegion: $region,
            annotationItems: [place]
        ) { place in
            MapAnnotation(coordinate: .init(latitude: place.latitude, longitude: place.longitude)) {
                Image(systemName: "mappin")
                    .frame(width: Constants.size, height: Constants.size)
            }
        }
    }
}
