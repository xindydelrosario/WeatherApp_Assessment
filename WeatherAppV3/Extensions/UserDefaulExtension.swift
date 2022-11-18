//
//  UserDefaulExtension.swift
//  WeatherAppV3
//
//  Created by xindy.del.rosario on 9/19/22.
//

import Foundation

extension UserDefaults {
    
    var unit: TemperatureUnit {
        guard let value = self.value(forKey: "unit") as? String else {
            return .celsius
        }
        return TemperatureUnit(rawValue: value) ?? .celsius
    }
    
}
