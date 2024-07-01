//
//  HeliTechAssignmentApp.swift
//  HeliTechAssignment
//
//  Created by Parsa on 6/29/24.
//

import SwiftUI
import Networking
import ComposableArchitecture

@main
struct HeliTechAssignmentApp: App {
    var body: some Scene {
        WindowGroup {
            if #available(iOS 16.0, *) {
                AppView(
                    store: .init(
                        initialState: .initial,
                        reducer: AppFeature()
                    )
                )
            } else {
                // Fallback on earlier versions
            }
        }

    }
}
