//
//  Constants.swift
//  WeatherAppV3
//
//  Created by xindy.del.rosario on 9/13/22.
//

import Foundation

struct Constants {
    
    class URLs {
        static func weatherByCoor(lat: Double, lon: Double) -> String {
           // return URL(string:
            return "https://api.openweathermap.org/data/2.5/forecast?lat=\(lat)&lon=\(lon)&appid=953add67a12dc794e7a69cde0e4a01c6&units=metric"
        }
    }
    class Strings {
            static var location = "Antipolo"
        }
}


