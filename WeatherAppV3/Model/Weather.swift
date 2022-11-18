//
//  Weather.swift
//  WeatherAppV3
//
//  Created by xindy.del.rosario on 9/13/22.
//

import Foundation

struct WeatherResponse: Codable {
    var list: [List]
    var city: City


    static func empty() -> WeatherResponse {
        WeatherResponse(
            list: [List](repeating: List(), count: 40),
            city: City()
        )
    }
}
struct List: Codable, Identifiable {
    var dt: Int
    var main: Main
    var weather: [Weather]
    var wind: Wind
    var id: UUID {
        UUID()
    }
    
    enum CodingKeys: String, CodingKey {
        case dt = "dt"
        case main = "main"
        case weather = "weather"
        case wind = "wind"
    }
    init() {
        dt = 0
        main = Main(temp: 0.0, humidity: 0.0, feels_like: 0.0, temp_min: 0.0, temp_max: 0.0, pressure: 0.0)
        weather = []
        wind = Wind(speed: 0.0)
    }
    
}

struct Wind: Codable{
    var speed: Double
}

struct Main: Codable {
    var temp: Double
    var humidity: Double
    var feels_like: Double
    var temp_min: Double
    var temp_max: Double
    var pressure: Double
}

struct Weather: Codable, Identifiable {
    var id: Int
    var main: String

}

struct City: Codable {
    var name: String
    var id: UUID {
        UUID()
        
    }

    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
    init() {
         name = ""
    }

}



 


