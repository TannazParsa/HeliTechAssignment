//
//  AppFeature.swift
//
//
//  Created by Parsa on 7/1/24.
//


import Combine
import SwiftUI
import Foundation
import ListFeature
import Models
import MapFeature
import ComposableArchitecture

/// The main feature reducer for the entire application.
public struct AppFeature: ReducerProtocol {
    
    // MARK: - State
    
    /// The state of the entire application.
    public struct State: Equatable {
        /// Enum representing different navigation routes within the app.
        public enum Route: Hashable {
            case details
            case map
        }

        /// Array representing the current navigation path in the app.
        var path: [Route] = []
        
        /// State related to the list feature.
        var listState: ListFeature.State
        
        /// Optional state related to the map feature.
        var mapState: MapFeature.State?
        
        /// Boolean indicating if the map is currently presented.
        public var isMapPresented: Bool = false

        /// Initial state setup.
        static let initial: Self = .init(
            path: [],
            listState: .init(shifts: ShiftRes(data: [], count: 0))
        )
    }

    // MARK: - Action
    
    /// Actions that can be performed within the app.
    public enum Action: Equatable {
        case list(ListFeature.Action)
        case map(MapFeature.Action)
        case path([State.Route])
        case emptyAction
        case presentMap
        case dismissMap
    }

    // MARK: - Reducer
    
    /// The main reducer for handling actions and modifying state.
    public var body: some ReducerProtocolOf<Self> {
        Reduce { state, action in
            switch action {
            case .list(.details(_)):
                state.path = [.details]
                return .none
            case .path(let newPath):
                state.path = newPath
                return .none
            case .emptyAction:
                state.path = [.details]
                return .none
            case .presentMap:
                state.mapState = MapFeature.State()
                state.path.append(.map)
                return .none
            case .dismissMap:
                state.mapState = nil
                return .none
            default:
                return .none
            }
        }
        
        Scope(
            state: \.listState,
            action: /Action.list
        ) {
            ListFeature()
        }
    }
}
