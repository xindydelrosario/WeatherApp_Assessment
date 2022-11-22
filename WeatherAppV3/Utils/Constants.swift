//
//  Constants.swift
//  WeatherAppV3
//
//  
//

import Foundation
import Combine
import SwiftUI
import CoreLocation

struct Constants {
    

    @State var tokens: Set<AnyCancellable> = []
    @State var coordinates: (lat: Double, lon: Double) = (0,0)
    @StateObject var deviceLocationService = DeviceLocationService.shared

    
//    lazy var currentLocation = DeviceLocation.currentPlacemark?.administrativeArea
//    init (currentLocation: String)  {
//        self.currentLocation = currentLocation
//    } // FOR CITY NAME
    
    class URLs {
        static func weatherByCoor(lat: Double, lon: Double) -> String {
            // return URL(string:
            return "https://api.openweathermap.org/data/2.5/forecast?lat=\(lat)&lon=\(lon)&appid=953add67a12dc794e7a69cde0e4a01c6&units=metric"
        }
    }// old API
    
    class Strings {
         static var location = ""
        //lazy var location = "\(DeviceLocation.currentPlacemark?.administrativeArea)"
         //static var location = "\(currentLocation)"
        //location not working
    }
    lazy var currentLat = coordinates.lat
    lazy var currentLon = coordinates.lon
    init (currentLat: Double, currentLon: Double) {
        self.currentLat = currentLat
        self.currentLon = currentLon
    }
    
        class Url {
        static func coordinatesByCurrentCoor (currentLon: Double, currentLat: Double)-> String {
            return  "https://api.openweathermap.org/data/2.5/forecast?lat=\(currentLat)&lon=\(currentLon)&appid=953add67a12dc794e7a69cde0e4a01c6&units=metric"
        
        } // NO VALUE LAT AND LON
            
    }
    
    func observeCoordinateUpdates() {
        deviceLocationService.coordinatesPublisher
            .receive(on: DispatchQueue.main)
            .sink { completion in
                if case .failure(let error) = completion {
                    print (error)
                }
            }receiveValue: { coordinates in
                self.coordinates = (coordinates.latitude, coordinates.longitude)
            }
            .store(in: &tokens)
    }
    
    func observeLocationAccessDenied() {
        deviceLocationService.deniedLocationAccessPublisher
            .receive(on: DispatchQueue.main)
            .sink {
                print("alert")
            }
            .store(in: &tokens)
    }
    
}


