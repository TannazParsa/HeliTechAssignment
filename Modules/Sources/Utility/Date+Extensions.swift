//
//  String+Extensions.swift
//  NewsApp
//
//  Created by Dmitriy Lupych on 7/12/19.
//  Copyright © 2019 Dmitry Lupich. All rights reserved.
//

import Foundation

public extension DateFormatter {
    static let iso8601WithoutTime: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-mm-dd"
        return formatter
    }()
}
