//
//  HeliTechAssignmentTests.swift
//  HeliTechAssignmentTests
//
//  Created by Parsa on 6/29/24.
//

import XCTest
@testable import HeliTechAssignment
@testable import Modules
import ComposableArchitecture  // Import the module where StoreOf is defined

class ListFeatureTests: XCTestCase {
    
    var store: StoreOf<ListFeature.State, ListFeature.Action, ListFeature.Environment>!  // Adjust type parameters as per your actual usage
    
    override func setUpWithError() throws {
        // Initialize any dependencies needed for tests, such as a StoreOf instance
        store = StoreOf<ListFeature.State, ListFeature.Action, ListFeature.Environment>(initialState: ListFeature.State(shifts: ShiftRes()), reducer: listFeatureReducer, environment: ListEnvironment())
    }

    override func tearDownWithError() throws {
        // Clean up any resources used in tests
        store = nil
    }

    func testScrollToBottomUpdatesDate() throws {
        // Simulate scrolling to bottom in ListView and verify date update
        
        let listView = ListView(store: store)
        // Perform setup to simulate scrolling to bottom
        
        // Assert that after scrolling to bottom, the date should update to tomorrow
        let originalDate = store.state.date
        listView.store.send(.didScrollToBottom)
        let updatedDate = store.state.date
        
        // Assert that the date has been correctly updated
        XCTAssertNotEqual(originalDate, updatedDate, "Expected date to be updated after scrolling to bottom")
    }

    // Add more functional tests as needed for other features of HeliTechAssignment

    func testPerformanceExample() throws {
        // Example of a performance test
        self.measure {
            // Put code here to measure the performance of a specific part of your code
            // For example, call a function or method and measure its execution time
        }
    }
}

