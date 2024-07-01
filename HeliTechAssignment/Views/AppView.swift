//
//  AppView.swift
//  NewsApp
//
//  Created by Dmytro Lupych on 2/11/22.
//  Copyright © 2022 Dmitry Lupich. All rights reserved.
//

import SwiftUI
import ListFeature
import MapFeature
import ComposableArchitecture
import MapKit


@available(iOS 16.0, *)
struct AppView: View {
    let store: StoreOf<AppFeature>

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            GeometryReader { geometry in
                NavigationStack(
                    path: viewStore.binding(
                        get: \.path,
                        send: AppFeature.Action.path
                    )
                ) {
                    ZStack {
                        ListView(
                            store: store.scope(
                                state: \.listState,
                                action: AppFeature.Action.list
                            )
                        )
                        .onAppear {
                            viewStore.send(.list(.start))
                        }
                        .navigationDestination(for: AppFeature.State.Route.self) { route in
                            switch route {
                            case .details:
                                Text("Empty View")
                            case .map:
                                IfLetStore(
                                    self.store.scope(
                                        state: \.mapState,
                                        action: AppFeature.Action.map
                                    ),
                                    then: { mapStore in
                                        MapPage(store: mapStore)
                                    }
                                )
                            }
                        }
                        
                        DualActionButtonView( filterAction: {
                            viewStore.send(.emptyAction)
                        }, kaartAction: {
                            viewStore.send(.presentMap)
                        })
                        .shadow(radius: 2)
                        .position(CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 1.3))
                        .frame(maxWidth: .infinity)
                    }
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            viewStore.send(.emptyAction)
                        }) {
                            Text("Sign up")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .padding()
                        }
                        .background(Color.green)
                        .cornerRadius(8)
                        .padding()
                        
                        Button(action: {
                            viewStore.send(.emptyAction)
                        }) {
                            Text("Log in")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .padding()
                        }
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.white, lineWidth: 1)
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black, lineWidth: 1)
                        }
                        .padding()
                    }
                }
            }
        }
    }
}

fileprivate extension ViewStore<AppFeature.State, AppFeature.Action> {
    func start() {
        send(.list(.start))
    }
}
