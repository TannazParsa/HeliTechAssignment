//
//  NAError.swift
//
//  Created by Parsa on 6/29/24.
//

import Foundation

/// Constants used for error descriptions
fileprivate struct Constants {
    static let badUrl = "Sorry, this URL is not valid"
    static let mapping = "Error raised, while mapping data"
    static let generic = "Sorry, try again later"
}
/// Enum representing network API errors
public enum NAError: Equatable {
    case badUrl
    case mapping
    case generic
}

extension NAError: Error {
    /// Localized description for each error case
    public var localizedDescription: String {
        switch self {
        case .badUrl:
            return Constants.badUrl
        case .mapping:
            return Constants.mapping
        case .generic:
            return Constants.generic
        }
    }
}
