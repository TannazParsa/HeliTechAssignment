//
//  File.swift
//  
//
//  Created by Parsa on 6/29/24.
//

import Foundation
public struct ShiftRes : Codable, Equatable {
    public let data: [ShiftModel]
    public let count: Int

    enum CodingKeys: String, CodingKey {
        case data
        case count = "aggregations"
    }

    enum AggregationsKeys: String, CodingKey {
        case count
    }
    
    public init(data: [ShiftModel], count: Int) {
        self.data = data
        self.count = count
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let aggregationsValues = try values.nestedContainer(keyedBy: AggregationsKeys.self, forKey: .count)
        data = try values.decode([ShiftModel].self, forKey: .data)
        count = try aggregationsValues.decode(Int.self, forKey: .count)
    }

}
