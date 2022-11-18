//
//  DateExtension.swift
//  WeatherAppV3
//
// 
//

import Foundation

class Time {
    static let defaultDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        return formatter
    }()
 }
