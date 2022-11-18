//
//  DateExtension.swift
//  WeatherAppV3
//
//  Created by xindy.del.rosario on 9/19/22.
//

import Foundation

class Time {
    static let defaultDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        return formatter
    }()
 }
