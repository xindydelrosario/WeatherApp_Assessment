//
//  UserDefaults.swift
//  WeatherAppV3
//
//  Created by xindy.del.rosario on 9/13/22.
//

import Foundation

extension UserDefaults {
    var unit: UnitTemperature {
        guard let value = self.value(forKey: "unit") as? String else {
            return.kelvin
        }
        return UnitTemperature(symbol: value)
    }
}
