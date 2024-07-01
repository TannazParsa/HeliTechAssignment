//
//  NetworkService.swift
//
//  Created by Parsa on 6/29/24.
//

import Combine
import Foundation

/// Protocol defining network request functionality
public protocol NetworkProtocol {
    func request<T: Decodable>(endpoint: Endpoint) -> AnyPublisher<T, NAError>
}

/// Class responsible for making network requests
public final class Networking {
    private let session: URLSession
    private let decoder = JSONDecoder()

    /// Initializes the networking class with a URLSession instance
    public init(session: URLSession) {
        self.session = session
    }
}

extension Networking: NetworkProtocol {
    /// Executes a network request and returns a publisher that emits a decodable type or an error
    public func request<T: Decodable>(endpoint: Endpoint) -> AnyPublisher<T, NAError> {
        guard let url = endpoint.url else {
            return Fail(error: NAError.badUrl).eraseToAnyPublisher()
        }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.httpMethod
        print(url)
        return session.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: T.self, decoder: decoder)
            .mapError { error -> NAError in
                if let decodingError = error as? DecodingError {
                    // Handle decoding errors
                    print("Decoding error:", decodingError)
                    return .mapping
                } else {
                    // Handle other errors
                    print("Network error:", error)
                    return .generic
                }
            }
            .eraseToAnyPublisher()
    }
}
