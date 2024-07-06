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
        print("Request URL: \(url)")

        return session.dataTaskPublisher(for: request)
            .tryMap { result -> Data in
                // Print the HTTP response status code and headers
                if let httpResponse = result.response as? HTTPURLResponse {
                    print("HTTP Status Code: \(httpResponse.statusCode)")
                    print("HTTP Headers: \(httpResponse.allHeaderFields)")
                }

                // Print the raw response body
                if let responseString = String(data: result.data, encoding: .utf8) {
                    print("Raw response: \(responseString)")
                } else {
                    print("Failed to decode response as string")
                }

                return result.data
            }
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
