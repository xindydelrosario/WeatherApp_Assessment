//
//  DoubleExtension.swift
//  WeatherAppV3
//
// 
//

import Foundation

extension Double {
    func roundDouble() -> String {
        return String(format: "%1.0f", self)
    }
}
