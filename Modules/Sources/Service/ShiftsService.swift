//
//  File.swift
//  
//
//  Created by Parsa on 6/29/24.
//

import Combine
import Foundation
import Networking
import Models
// MARK: - Service Contract

/// Protocol defining methods for fetching shifts data
public protocol ShiftServiceProtocol {
    func shifts(for date: Date) -> AnyPublisher<ShiftRes, NAError>
}

// MARK: - Shifts Service

/// Service responsible for fetching shifts data
public final class ShiftsService {
    private let network: NetworkProtocol

    /// Initializes the shifts service with a network handler
    /// - Parameter network: The network handler conforming to `NetworkProtocol`
    public init(network: NetworkProtocol) {
        self.network = network
    }
}

// MARK: - Protocol Methods

extension ShiftsService: ShiftServiceProtocol {
    /// Fetches shifts data for a specific date
    /// - Parameter date: The date for which shifts data is requested
    /// - Returns: A publisher emitting `ShiftRes` or an `NAError` if the request fails
    public func shifts(for date: Date) -> AnyPublisher<ShiftRes, NAError> {
        network.request(endpoint: .shifts(date: date))
    }
}
