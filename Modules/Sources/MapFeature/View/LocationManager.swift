//
//  File.swift
//  
//
//  Created by Parsa on 6/29/24.
//

import Foundation
import MapKit

/// A location manager that tracks the user's current location.
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()

    @Published var location: CLLocation? = nil

    /// Initializes the location manager and sets up its delegate and desired accuracy.
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization() // Request permission to use location services when the app is in use.
    }

    /// Called when new location data is available.
    /// - Parameters:
    ///   - manager: The location manager object.
    ///   - locations: An array of `CLLocation` objects, with the most recent location last.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first // Update the published location with the most recent location.
    }
}
