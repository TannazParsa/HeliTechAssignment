//
//  ListStore.swift
//
//
//  Created by Parsa on 6/29/24.
//

import Models
import Service
import Foundation
import Networking
import ComposableArchitecture

/// The ListFeature reducer handling actions, state, and environment for the list feature.
public struct ListFeature: ReducerProtocol {
    
    //MARK: - Environment
    /// The environment for the list feature containing the shifts service.
    private let environment: ListEnvironment = .init(
        shiftsService: ShiftsService(
            network: Networking(
                session: .shared
            )
        )
    )

    //MARK: - State
    /// The state representing the data and status of the list feature.
    public struct State: Equatable {
        /// The current date.
        public var date: Date = Date()
        /// The shift response data.
        public var shifts: ShiftRes
        /// Indicates if data is currently loading.
        public var isLoading: Bool = false

        /// Initializes a new state with the given shifts.
        /// - Parameter shifts: The shift response data.
        public init(shifts: ShiftRes) {
            self.shifts = shifts
        }
    }

    //MARK: - Action
    /// The actions that can be performed in the list feature.
    public enum Action: Equatable {
        case start
        case didScrollToBottom
        case details(ShiftModel)
        case onAppear(ShiftModel)
        case shiftsResponse(Result<ShiftRes, NAError>)
    }

    //MARK: - Reducer
    /// The reducer handling the logic for state transitions based on actions.
    public var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .start:
                state.isLoading = true
                return environment
                    .shiftsService
                    .shifts(for: state.date)
                    .receive(on: DispatchQueue.main)
                    .catchToEffect(Action.shiftsResponse)
                    
            case let .shiftsResponse(.success(shifts)):
                state.isLoading = false
                state.shifts = shifts
                return .none
                
            case let .shiftsResponse(.failure(error)):
                state.isLoading = false
                print("❇️ Error:", error.localizedDescription)
                return .none
                
            case .didScrollToBottom:
                // Calculate tomorrow's date
                let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: state.date) ?? Date()
                state.date = tomorrow
                // Trigger the API call with tomorrow's date
                state.isLoading = true
                return environment
                    .shiftsService
                    .shifts(for: tomorrow)
                    .receive(on: DispatchQueue.main)
                    .catchToEffect(Action.shiftsResponse)
                    
            case .onAppear(let post):
                return post == state.shifts.data.last ?
                EffectTask(value: Action.didScrollToBottom) : .none
                
            case .details(_):
                return .none
            }
        }
    }

    /// Initializes a new instance of the ListFeature reducer.
    public init() {}
}
