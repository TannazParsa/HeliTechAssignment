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
    public let earnings_per_hour : Earnings_per_hour
    public let job : Job


  public static let mock: Self = .init(id: "0", status: "Served", earnings_per_hour: Earnings_per_hour(currency: "$", amount: 20.0), job: Job(id: "", title: "", extra_briefing: "", dress_code: "", tips: false, slug: "", is_agency: false, links: Links(get_directions: "", thumb_image: "", hero_image: ""), skills: [], project: Project(id: "", name: "", client: nil), category: Category(id: "", internalId: 0, name: "", slug: "", links: Links(get_directions: "", thumb_image: "", hero_image: ""))))


    enum CodingKeys: String, CodingKey {

        case id = "id"
        case status = "status"
        case job = "job"
        case earnings_per_hour = "earnings_per_hour"
    }
    
  public init(id: String, status: String, earnings_per_hour: Earnings_per_hour, job: Job) {
    self.id = id
    self.status = status
    self.earnings_per_hour = earnings_per_hour
    self.job = job
  }


}

