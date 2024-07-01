//
//  ListEnvironment.swift
//
//
//  Created by Parsa on 6/29/24.
//

import Service

/// The environment for the List feature, containing all dependencies required by the feature.
public struct ListEnvironment {
    
    /// The service used to fetch shift data.
    public let shiftsService: ShiftServiceProtocol

    /// Initializes a new instance of `ListEnvironment` with the specified shift service.
    /// - Parameter shiftsService: The service used to fetch shift data.
    public init(shiftsService: ShiftServiceProtocol) {
        self.shiftsService = shiftsService
    }
}
