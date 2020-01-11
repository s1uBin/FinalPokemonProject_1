//
//  MapView.swift
//  FinalPokemonProject
//
//  Created by user on 5/1/2020.
//  Copyright © 2020 00557052. All rights reserved.
//

import Foundation
import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
    
    var coordinate : CLLocationCoordinate2D
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 2500, longitudinalMeters: 2500)
        mapView.setRegion(region, animated: true)
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
}
