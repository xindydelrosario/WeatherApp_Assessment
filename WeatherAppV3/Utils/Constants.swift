//
//  Constants.swift
//  WeatherAppV3
//
//  
//

import Foundation
import Combine
import SwiftUI
import MapKit

struct Constants {

    @State var coordinates: (lat: Double, lon: Double) = (0,0)


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

private let apiKey = "<953add67a12dc794e7a69cde0e4a01c>"

private var subscriptions = Set<AnyCancellable>()
    
func getAllWeatherInfo(for location: CLLocationCoordinate2D, onComplete: @escaping ((WeatherResponse?)->Void)) {
    let lat = location.latitude
    let lon = location.longitude
    
    guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&exclude=minutely,alerts&units=metric&appid=\(apiKey)") else { return }
    
    URLSession.shared
        .dataTaskPublisher(for: url)
        .map(\.data)
        .decode(type: WeatherResponse.self, decoder: JSONDecoder())
        .sink { completion in
            
            if case .failure(let err) = completion {
                print("Retrieving data from weather service received this error: \(err)")
                onComplete(nil)
            }
            
        } receiveValue: { object in
            
            DispatchQueue.main.async {
                onComplete(object)
            }
        }
        .store(in: &subscriptions)
}


