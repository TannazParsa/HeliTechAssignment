//
//  File.swift
//  
//
//  Created by tanaz on 11/04/1403 AP.
//

import Foundation
import SwiftUI
import ComposableArchitecture

/// A SwiftUI view representing a page with a map and associated state management.
public struct MapPage: View {
    
    private let store: StoreOf<MapFeature>
    
    /// Initializes a new map page with the given store.
    /// - Parameter store: The store containing the state and actions for the map feature.
    public init(store: StoreOf<MapFeature>) {
        self.store = store
    }
    
    /// The body of the view, defining its UI elements.
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            ScrollView {
                MapView() // Display the map view.
            }
            .padding(.horizontal, 16) // Add horizontal padding to the scroll view.
            .onAppear { viewStore.send(.onAppear) } // Trigger the onAppear action when the view appears.
            .onDisappear { viewStore.send(.onDisappear) } // Trigger the onDisappear action when the view disappears.
        }
    }
}
