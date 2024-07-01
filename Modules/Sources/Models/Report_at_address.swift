/* 
Copyright (c) 2024 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Report_at_address : Codable {
	let zip_code : String?
	let zipcode : String?
	let street : String?
	let number : String?
	let number_with_extra : String?
	let extra : String?
	let city : String?
	let line1 : String?
	let line2 : String?
	let links : Links?
	let country : Country?
	let geo : Geo?
	let region : String?

	enum CodingKeys: String, CodingKey {

		case zip_code = "zip_code"
		case zipcode = "zipcode"
		case street = "street"
		case number = "number"
		case number_with_extra = "number_with_extra"
		case extra = "extra"
		case city = "city"
		case line1 = "line1"
		case line2 = "line2"
		case links = "links"
		case country = "country"
		case geo = "geo"
		case region = "region"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		zip_code = try values.decodeIfPresent(String.self, forKey: .zip_code)
		zipcode = try values.decodeIfPresent(String.self, forKey: .zipcode)
		street = try values.decodeIfPresent(String.self, forKey: .street)
		number = try values.decodeIfPresent(String.self, forKey: .number)
		number_with_extra = try values.decodeIfPresent(String.self, forKey: .number_with_extra)
		extra = try values.decodeIfPresent(String.self, forKey: .extra)
		city = try values.decodeIfPresent(String.self, forKey: .city)
		line1 = try values.decodeIfPresent(String.self, forKey: .line1)
		line2 = try values.decodeIfPresent(String.self, forKey: .line2)
		links = try values.decodeIfPresent(Links.self, forKey: .links)
		country = try values.decodeIfPresent(Country.self, forKey: .country)
		geo = try values.decodeIfPresent(Geo.self, forKey: .geo)
		region = try values.decodeIfPresent(String.self, forKey: .region)
	}

}