//
//  File.swift
//  
//
//  Created by Parsa on 6/29/24.
//

import Foundation

public struct ShiftModel: Equatable, Codable, Identifiable {
    public static func == (lhs: ShiftModel, rhs: ShiftModel) -> Bool {
        lhs.id == rhs.id
    }
    
    public let id : String
    public let status : String
    public let earnings_per_hour : String
    public let job : Job
    public let startsAt: Date
    public let endsAt: Date

    static let isoDateFormatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withDashSeparatorInDate, .withColonSeparatorInTime, .withTimeZone]
        return formatter
    }()


    public static let mock: Self = .init(id: "0", status: "Served", earnings_per_hour: "20 $", job: Job(id: "", title: "", extra_briefing: "", dress_code: "", tips: false, slug: "", is_agency: false, links: Links(get_directions: "", thumb_image: "", hero_image: ""), skills: [], project: Project(id: "", name: "", client: nil), category: Category(id: "", internalId: 0, name: "", slug: "", links: Links(get_directions: "", thumb_image: "", hero_image: ""))),startAt: Date(), endsAt: Date())


    enum CodingKeys: String, CodingKey {

        case id = "id"
        case status = "status"
        case job = "job"
        case earnings_per_hour = "earnings_per_hour"
        case startsAt = "starts_at"
        case endsAt = "ends_at"
    }
    
    public init(id: String, status: String, earnings_per_hour: String, job: Job, startAt: Date,endsAt: Date) {
    self.id = id
    self.status = status
    self.earnings_per_hour = earnings_per_hour
    self.job = job
    self.startsAt = startAt
    self.endsAt = endsAt
  }
    
    enum EarningsPerHourKeys: String, CodingKey {
        case currency
        case amount
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        // id
        id = try values.decode(String.self, forKey: .id)

        status = try values.decode(String.self, forKey: .status)
        // startsAt
        guard let startsAtValue = ShiftModel.isoDateFormatter.date(from: try values.decode(String.self, forKey: .startsAt)) else {
            throw DecodingError.dataCorruptedError(forKey: .startsAt, in: values, debugDescription: "Expecting a valid date format")
        }

        startsAt = startsAtValue

        // endsAt
        guard let endsAtValue = ShiftModel.isoDateFormatter.date(from: try values.decode(String.self, forKey: .endsAt)) else {
            throw DecodingError.dataCorruptedError(forKey: .startsAt, in: values, debugDescription: "Expecting a valid date format")
        }

        endsAt = endsAtValue
        // earningsPerHour
        let earningsPerHourValues = try values.nestedContainer(keyedBy: EarningsPerHourKeys.self, forKey: .earnings_per_hour)

        let earningsPerHourCurrencyValue = try earningsPerHourValues.decode(String.self, forKey: .currency)
        let earningsPerHourAmountValue = try earningsPerHourValues.decode(Double.self, forKey: .amount)

        earnings_per_hour = "\(Currency(shorthand: earningsPerHourCurrencyValue).sign) \(String(format: "%02.02f", earningsPerHourAmountValue))"

        // job
        job = try values.decode(Job.self, forKey: .job)
    }


}

enum Currency {
    case euro
    case unitedStatesDollar
    case unknown

    init(shorthand: String) {
        switch shorthand {
        case "EUR":
            self = .euro
        case "USD":
            self = .unitedStatesDollar
        default:
            self = .unknown
        }
    }

    var sign: String {
        switch self {
        case .euro:
            return "€"
        case .unitedStatesDollar:
            return "$"
        case .unknown:
            return "?"
        }
    }
}
