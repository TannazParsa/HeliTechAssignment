//
//  ListPage.swift
//
//
//  Created by Parsa on 6/29/24.
//

import SwiftUI
import Combine
import ComposableArchitecture

//MARK: - View

/// A SwiftUI view representing a list of items, with infinite scrolling and loading indicators.
public struct ListView: View {
    private let store: StoreOf<ListFeature>
    
    /// Initializes a new list view with the given store.
    /// - Parameter store: The store containing the state and actions for the list feature.
    public init(store: StoreOf<ListFeature>) {
        self.store = store
    }
    
    @State private var hasAppeared = false
    @State private var isScrollingToBottom = false

    /// The body of the view, defining its UI elements.
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            GeometryReader { geometry in
                ScrollViewReader { scrollView in
                    List {
                        ForEach(viewStore.shifts.data, id: \.id) { post in
                            ListItem(model: .init(post: post))
                                .id(post.id)
                                .frame(height: 290)
                                .onAppear {
                                    // Detect when the last item appears
                                    if viewStore.state.shifts.data.last == post {
                                        isScrollingToBottom = true
                                    }
                                    // Trigger action when the view appears
                                    if !hasAppeared {
                                        viewStore.send(.onAppear(post))
                                        hasAppeared = true
                                    }
                                }
                        }
                    }
                    .onChange(of: viewStore.shifts.data.count) { _ in
                        // Scroll to bottom when new data is loaded
                        if viewStore.isLoading {
                            scrollView.scrollTo(viewStore.shifts.data.last?.id, anchor: .bottom)
                        }
                    }
                    .background(
                        GeometryReader { proxy -> Color in
                            let minY = proxy.frame(in: .global).minY
                            let maxY = proxy.frame(in: .global).maxY
                            let height = geometry.size.height
                            
                            // Check if scrolling is complete
                            DispatchQueue.main.async {
                                isScrollingToBottom = (minY <= 0 && maxY >= height)
                            }
                            
                            return Color.clear
                        }
                    )
                    .toolbar {
                        if viewStore.isLoading {
                            ProgressView()
                        }
                    }
                    .onChange(of: isScrollingToBottom) { scrollingToBottom in
                        if scrollingToBottom && !viewStore.isLoading {
                            // Send action when scrolling to bottom and all data is visible
                            viewStore.send(.didScrollToBottom)
                        }
                    }
                }
            }
        }
    }
}
