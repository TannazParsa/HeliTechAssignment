//
//  File.swift
//
//
//  Created by Parsa on 6/29/24.
//

import Foundation
import ComposableArchitecture

//MARK: - MapFeature

/// A reducer handling state and actions for the map feature.
public struct MapFeature: ReducerProtocol {
    //MARK: - State

    /// The state of the map feature.
    public struct State: Equatable {
        public var isRouting: Bool = false

        /// Initializes a new state.
        public init() {}
    }

    //MARK: - Action

    /// The actions that can be performed on the map feature.
    public enum Action: Equatable {
        case onAppear
        case onDisappear
    }

    //MARK: - Reducer

    /// The reducer handling the actions and updating the state.
    public var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                state.isRouting = true
                return .none
            case .onDisappear:
                state.isRouting = false
                return .none
            }
        }
    }
    
    /// Initializes a new map feature.
    public init() {}
}

