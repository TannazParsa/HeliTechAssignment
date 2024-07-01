/* 
Copyright (c) 2024 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
public struct Job : Codable {
    public let id : String?
    public let title : String?
    public let extra_briefing : String?
    public let dress_code : String?
    public let tips : Bool?
    public let slug : String?
    public let is_agency : Bool?
    public let links : Links?
    public let skills : [Skills]?
    public let project : Project?
    public let category : Category?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case title = "title"
		case extra_briefing = "extra_briefing"
		case dress_code = "dress_code"
		case tips = "tips"
		case slug = "slug"
		case is_agency = "is_agency"
		case links = "links"
		case skills = "skills"
		case project = "project"
		case category = "category"

	}
    
    init(id: String?, title: String?, extra_briefing: String?, dress_code: String?, tips: Bool?, slug: String?, is_agency: Bool?, links: Links?, skills: [Skills]?, project: Project?, category: Category?) {
        self.id = id
        self.title = title
        self.extra_briefing = extra_briefing
        self.dress_code = dress_code
        self.tips = tips
        self.slug = slug
        self.is_agency = is_agency
        self.links = links
        self.skills = skills
        self.project = project
        self.category = category
    }

  

}
