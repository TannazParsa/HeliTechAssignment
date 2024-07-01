//
//  File.swift
//  
//
//  Created by Parsa on 7/1/24.
//

import Foundation
import SwiftUI
import MapKit

final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager?

    // Published property to track the map's region
    @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 43.457105, longitude: -80.508361),
                                                  span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))

    // Binding to the mapRegion for two-way binding in SwiftUI
    var binding: Binding<MKCoordinateRegion> {
        Binding {
            self.mapRegion
        } set: { newRegion in
            self.mapRegion = newRegion
        }
    }

    // Checks if location services are enabled
    func checkIfLocationIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
            locationManager!.delegate = self
        } else {
            print("Location services are disabled.")
            //  might want to handle this scenario by showing an alert to the user
        }
    }

    // Handles changes in location authorization status
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let previousAuthorizationStatus = manager.authorizationStatus
        manager.requestWhenInUseAuthorization()
        if manager.authorizationStatus != previousAuthorizationStatus {
            checkLocationAuthorization()
        }
    }

    // Checks the current location authorization status
    private func checkLocationAuthorization() {
        guard let location = locationManager else {
            return
        }

        switch location.authorizationStatus {
        case .notDetermined:
            print("Location authorization is not determined.")
        case .restricted:
            print("Location is restricted.")
        case .denied:
            print("Location permission denied.")
        case .authorizedAlways, .authorizedWhenInUse:
            if let location = location.location {
                // Updates mapRegion to current location if authorized
                mapRegion = MKCoordinateRegion(center: location.coordinate,
                                               span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
            }
        default:
            break
        }
    }
}
