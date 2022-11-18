//
//  DoubleExtension.swift
//  WeatherAppV3
//
//  Created by xindy.del.rosario on 9/17/22.
//

import Foundation

extension Double {
    func roundDouble() -> String {
        return String(format: "%1.0f", self)
    }
}
