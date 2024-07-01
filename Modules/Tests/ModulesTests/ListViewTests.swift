//
//  ListViewTests.swift
//  
//
//  Created by Parsa on 7/1/24.
//

import SwiftUI
import ComposableArchitecture
@testable import Modules

class ListViewTests: XCTestCase {

    // Mock StoreOf for testing ListView
    class MockStoreOf<T>: StoreProtocol {
        var state: T
        var send: (T.Action) -> Void
        var view: StorePublisher<T>
        
        init(state: T, send: @escaping (T.Action) -> Void) {
            self.state = state
            self.send = send
            self.view = StorePublisher()
        }
    }

    // Test case for ListView body rendering
    func testListViewBody() throws {
        let initialState = ListFeature.State(shifts: ShiftRes(data: []))
        let store = MockStoreOf(state: initialState) { action in
            // Handle actions if needed for testing
        }
        
        let listView = ListView(store: store)

        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Example:
        XCTAssertEqual(listView.body.view.content, ListView_Previews.self)
    }

    // Additional tests can be added to test specific behaviors of ListView
}
