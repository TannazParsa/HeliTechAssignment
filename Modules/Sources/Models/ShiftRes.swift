//
//  File.swift
//  
//
//  Created by Parsa on 6/29/24.
//

import Foundation
public struct ShiftRes : Codable, Equatable {
    public let data : [ShiftModel]

    enum CodingKeys: String, CodingKey {

        case data = "data"
    }

    public init(data: [ShiftModel]) {
        self.data = data
    }

}
