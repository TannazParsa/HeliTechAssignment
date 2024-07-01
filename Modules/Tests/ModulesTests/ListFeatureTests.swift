//
//  ListFeatureTests.swift
//
//  Created by Parsa on 6/29/24.
//

import XCTest
import Combine
@testable import Modules

class ListFeatureTests: XCTestCase {

    // Mock ShiftsService for testing
    class MockShiftsService: ShiftsServiceProtocol {
        func shifts(for date: Date) -> AnyPublisher<ShiftRes, NAError> {
            // Mock implementation for shifts API call
            // Return a dummy ShiftRes for testing purposes
            let shifts = ShiftRes(data: [ShiftModel(id: "1", title: "Shift 1", date: date)])
            return Result.Publisher(.success(shifts))
                .eraseToAnyPublisher()
        }
    }

    // Mock environment for testing ListFeature
    struct MockListEnvironment: ListEnvironment {
        var shiftsService: ShiftsServiceProtocol {
            MockShiftsService()
        }
    }

    // Test case for start action
    func testStartAction() throws {
        let initialState = ListFeature.State(shifts: ShiftRes(data: []))
        let environment = MockListEnvironment()
        var cancellables: Set<AnyCancellable> = []

        // Create a test store with initial state and environment
        let store = Store(initialState: initialState, reducer: ListFeature().reducer, environment: environment)

        // Dispatch start action
        store.send(.start)

        // Assert isLoading is true initially
        XCTAssertTrue(store.state.isLoading)

        // Wait for the action to complete (assuming a short delay)
        wait(for: [expectation(description: "API call completion")], timeout: 1.0)

        // Assert isLoading is false after API call completes
        XCTAssertFalse(store.state.isLoading)
        // Assert shifts data is updated
        XCTAssertFalse(store.state.shifts.data.isEmpty)
    }

    // Test case for didScrollToBottom action
    func testDidScrollToBottomAction() throws {
        let initialState = ListFeature.State(shifts: ShiftRes(data: []))
        let environment = MockListEnvironment()
        var cancellables: Set<AnyCancellable> = []

        // Create a test store with initial state and environment
        let store = Store(initialState: initialState, reducer: ListFeature().reducer, environment: environment)

        // Dispatch didScrollToBottom action
        store.send(.didScrollToBottom)

        // Assert isLoading is true initially
        XCTAssertTrue(store.state.isLoading)

        // Wait for the action to complete (assuming a short delay)
        wait(for: [expectation(description: "API call completion")], timeout: 1.0)

        // Assert isLoading is false after API call completes
        XCTAssertFalse(store.state.isLoading)
        // Assert shifts data is updated
        XCTAssertFalse(store.state.shifts.data.isEmpty)
    }

    // Additional tests can be added for other actions such as onAppear, shiftsResponse, etc.

    // Helper method to fulfill expectations
    func expectation(description: String) -> XCTestExpectation {
        return XCTestExpectation(description: description)
    }
}
