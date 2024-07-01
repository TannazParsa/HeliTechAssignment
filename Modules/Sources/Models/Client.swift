/* 
Copyright (c) 2024 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
public struct Client : Codable {
    public let id : String?
    public let uuid : String?
    public let name : String?
    public let slug : String?
    public let registration_name : String?
    public let registration_id : String?
    public let description : String?
    public let allow_temper_trial : Bool?
    public let payment_term : Int?
    public let links : Links?
    public let average_response_time : Double?
    public let factoring_allowed : Bool?
    public let factoring_payment_term_in_days : Int?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case uuid = "uuid"
		case name = "name"
		case slug = "slug"
		case registration_name = "registration_name"
		case registration_id = "registration_id"
		case description = "description"
		case allow_temper_trial = "allow_temper_trial"
		case payment_term = "payment_term"
		case links = "links"
		case average_response_time = "average_response_time"
		case factoring_allowed = "factoring_allowed"
		case factoring_payment_term_in_days = "factoring_payment_term_in_days"
	}

    public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		uuid = try values.decodeIfPresent(String.self, forKey: .uuid)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		slug = try values.decodeIfPresent(String.self, forKey: .slug)
		registration_name = try values.decodeIfPresent(String.self, forKey: .registration_name)
		registration_id = try values.decodeIfPresent(String.self, forKey: .registration_id)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		allow_temper_trial = try values.decodeIfPresent(Bool.self, forKey: .allow_temper_trial)
		payment_term = try values.decodeIfPresent(Int.self, forKey: .payment_term)
		links = try values.decodeIfPresent(Links.self, forKey: .links)
		average_response_time = try values.decodeIfPresent(Double.self, forKey: .average_response_time)
		factoring_allowed = try values.decodeIfPresent(Bool.self, forKey: .factoring_allowed)
		factoring_payment_term_in_days = try values.decodeIfPresent(Int.self, forKey: .factoring_payment_term_in_days)
	}

}
