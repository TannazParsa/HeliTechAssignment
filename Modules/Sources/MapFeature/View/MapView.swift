//
//  File.swift
//  
//
//  Created by tanaz on 11/04/1403 AP.
//

import SwiftUI
import MapKit

struct MapView: View {
    // Creates a state object for managing the MapViewModel
    @StateObject var viewModel = MapViewModel()

    var body: some View {
        VStack {
            // Displays a Map using MapKit
            Map(coordinateRegion: viewModel.binding, showsUserLocation: true, userTrackingMode: .constant(.follow))
                .edgesIgnoringSafeArea(.all) // Ignores safe area to occupy entire screen
                .onAppear {
                    // Checks if location services are enabled when the view appears
                    viewModel.checkIfLocationIsEnabled()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

