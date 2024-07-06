//
//  Endpoint.swift
//
//  Created by Parsa on 6/29/24.
//

import Foundation
import Utility

public enum HTTPMethod: String {
    case get = "GET"
}

public enum Endpoint {
    case shifts(date: Date)

    private var baseURL: String {
        return AppConstants.Domain.baseURL
    }

    private var path: String {
        switch self {
        case .shifts(let date):
            let formattedDate = date.formatted(.iso8601)
            return "\(baseURL)shifts?filter%5Bdate%5D=\(formattedDate)"
        }
    }

    /// Computed property to generate the URL for the endpoint
    public var url: URL? {
        return URL(string: path)
    }

    /// HTTP method associated with the endpoint
    public var httpMethod: String {
        return HTTPMethod.get.rawValue
    }
}
