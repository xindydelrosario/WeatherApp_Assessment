//
//  Constants.swift
//  WeatherAppV3
//
//  
//

import Foundation
import Combine
import SwiftUI

struct Constants {
    
    @StateObject var deviceLocationService = DeviceLocationService.shared
    @State var tokens: Set<AnyCancellable> = []
    @State var coordinates: (lat: Double, lon: Double) = (0,0)
    @EnvironmentObject var DeviceLocation: DeviceLocationService
    
    class URLs {
        static func weatherByCoor(lat: Double, lon: Double) -> String {
           // return URL(string:
            return "https://api.openweathermap.org/data/2.5/forecast?lat=\(lat)&lon=\(lon)&appid=953add67a12dc794e7a69cde0e4a01c6&units=metric"
        }
    }
    class Strings {
            static var location = "Antipolo"
            //static var location = "\(DeviceLocation.currentPlacemark?.administrativeArea)"
            //location not working
        }
    lazy var currentLat = coordinates.lat
    lazy var currentLon = coordinates.lon

    init (currentLat: Double, currentLon: Double){
        self.currentLat = currentLat
        self.currentLon = currentLon
//        let url =  "https://api.openweathermap.org/data/2.5/forecast?lat=\(coordinates.lat)&lon=\(coordinates.lon)&appid=953add67a12dc794e7a69cde0e4a01c6&units=metric"
 //
        }
// location coordinate not working
    }
    

