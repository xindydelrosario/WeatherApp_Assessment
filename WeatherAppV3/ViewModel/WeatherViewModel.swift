//
//  WeatherViewModel.swift
//  WeatherAppV3
//
//  
//

import Foundation
import CoreLocation
import SwiftUI
import Combine

class WeatherViewModel: ObservableObject {
    
    @State var coordinates: (lat: Double, lon: Double) = (0,0)
    @Published var weatherResponse = WeatherResponse.empty()
   // @Published var city = Constants.Strings.location {
    @Published var city = Constants.Strings.location {
        didSet {
            getLocation()
        }
    }
    
    
    let id = UUID()
  // CONVERT TEMPERATURE
    func getTemperatureByUnit(unit: TemperatureUnit) -> Double {
        switch unit {
        case .celsius:
            return weatherResponse.list[0].main.temp
        case .fahrenheit:
            return weatherResponse.list[0].main.temp * (9/5) + 32
        case .kelvin:
            return weatherResponse.list[0].main.temp + 273.15
        }
    }
    
    func getTemperatureByTempMax(unit: TemperatureUnit) -> Double {
        switch unit {
        case .celsius:
            return weatherResponse.list[0].main.temp_max
        case .fahrenheit:
            return weatherResponse.list[0].main.temp_max * (9/5) + 32
        case .kelvin:
            return weatherResponse.list[0].main.temp_max + 273.15
        }
    }
    
    func getTemperatureByTempMin(unit: TemperatureUnit) -> Double {
        switch unit {
        case .celsius:
            return weatherResponse.list[0].main.temp_min
        case .fahrenheit:
            return weatherResponse.list[0].main.temp_min * (9/5) + 32
        case .kelvin:
            return weatherResponse.list[0].main.temp_min + 273.15
        }
    }
    
    func getTemperatureByFeelsLike(unit: TemperatureUnit) -> Double {
        switch unit {
        case .celsius:
            return weatherResponse.list[0].main.feels_like
        case .fahrenheit:
            return weatherResponse.list[0].main.feels_like * (9/5) + 32
        case .kelvin:
            return weatherResponse.list[0].main.feels_like + 273.15
    
        }
    }
    
    func getTemperatureByDays(unit: TemperatureUnit) -> [Double] {
        switch unit {
            case .celsius:
                return [weatherResponse.list[8].main.temp,
                        weatherResponse.list[16].main.temp,
                        weatherResponse.list[24].main.temp,
                        weatherResponse.list[32].main.temp,
                        weatherResponse.list[39].main.temp]
            case .fahrenheit:
                return [weatherResponse.list[8].main.temp * (9/5) + 32,
                        weatherResponse.list[16].main.temp * (9/5) + 32,
                        weatherResponse.list[24].main.temp * (9/5) + 32,
                        weatherResponse.list[32].main.temp * (9/5) + 32,
                        weatherResponse.list[39].main.temp * (9/5) + 32]
            case .kelvin:
                return [weatherResponse.list[8].main.temp + 273.15,
                        weatherResponse.list[16].main.temp + 273.15,
                        weatherResponse.list[24].main.temp + 273.15,
                        weatherResponse.list[32].main.temp + 273.15,
                        weatherResponse.list[39].main.temp + 273.15]
        
            }
        
    } //:MARK CONVERT TEMPERATURE
    
    // convert the city name from searchbar to lat to lon GEOCODING
    init() {
            getLocation()
        print(weatherResponse.city.name)
        }
        func getLocation() {
            
            CLGeocoder().geocodeAddressString(city) { (placemarks, error) in
                if let places = placemarks,
                   let place = places.first {
                    self.getWeather(coor: place.location?.coordinate)
                }
            }
        }
        func getWeather(coor: CLLocationCoordinate2D?) {
            var urlString = ""
            if let coor = coor {
                urlString = Constants.URLs.weatherByCoor(lat: coor.latitude, lon: coor.longitude)
                //urlString = Constants.init(currentLat: coordinates.lat, currentLon: coordinates.lon)
                //location coordinate
            } else {
                urlString = Constants.URLs.weatherByCoor(lat: 0, lon: 0)
            }
            getWeatherInternal(city: city, for: urlString)
        }
        func getWeatherInternal(city: String, for urlString: String) {
            guard let url = URL(string: urlString) else {return}
            NetworkManager<WeatherResponse>.fetchWeather(for: url) { (result) in
                switch result {
                case .success(let response):
                    DispatchQueue.main.async { //
                        self.weatherResponse = response
                    }
                case .failure(let error):
                    print(error)
                }
            }
        } // convert the city name from searchbar to lat to lon
    
    
    var temp: Double {
        return weatherResponse.list[0].main.temp
    }
    var tempMin: Double{
        return weatherResponse.list[0].main.temp_min
    }
    var tempMax: Double{
        return weatherResponse.list[0].main.temp_max
    }
    
    var humidity: Double {
        return weatherResponse.list[0].main.humidity
    }
    var feelslike: Double {
        return weatherResponse.list[0].main.feels_like
    }
    
    var dt: String {
        return Time.defaultDateFormatter.string(from: Date (timeIntervalSince1970: TimeInterval((weatherResponse.list.first?.dt)!) )) //convert to date format
    }
    
    var name: String {
        return weatherResponse.city.name
    }
    
    var main: String {
        return weatherResponse.list[0].weather.first?.main ?? ""
    }

    var speed: Double {
        return weatherResponse.list[0].wind.speed
    }
    
    var pressure: Double {
        return weatherResponse.list[0].main.pressure
    }
    
    var DaysTemp: [Double] {
        return [weatherResponse.list[8].main.temp,
                weatherResponse.list[16].main.temp,
                weatherResponse.list[24].main.temp,
                weatherResponse.list[32].main.temp,
                weatherResponse.list[39].main.temp]
    }
    
    var DaysWeather: [String?] {
        return [weatherResponse.list[8].weather.first?.main ?? "",
                weatherResponse.list[16].weather.first?.main ?? "",
                weatherResponse.list[24].weather.first?.main ?? "",
                weatherResponse.list[32].weather.first?.main ?? "",
                weatherResponse.list[39].weather.first?.main ?? ""]
    }
    var Daysdt: [String] {
        return [Time.defaultDateFormatter.string(from: Date (timeIntervalSince1970: TimeInterval((weatherResponse.list[8].dt)))),
                Time.defaultDateFormatter.string(from: Date (timeIntervalSince1970: TimeInterval((weatherResponse.list[16].dt)))),
                Time.defaultDateFormatter.string(from: Date (timeIntervalSince1970: TimeInterval((weatherResponse.list[24].dt)))),
                Time.defaultDateFormatter.string(from: Date (timeIntervalSince1970: TimeInterval((weatherResponse.list[32].dt)))),
                Time.defaultDateFormatter.string(from: Date (timeIntervalSince1970: TimeInterval((weatherResponse.list[39].dt))))]

    
    }
    func getIcon(main: String) -> Image {
        switch main {
        case "Thunderstorm":
            return Image(systemName: "cloud.bolt")
        case "Drizzle":
            return Image(systemName: "cloud.drizzle")
        case "Rain":
            return Image(systemName: "cloud.rain")
        case "Snow":
            return Image(systemName: "cloud.snow")
        case "Atmosphere":
            return Image(systemName: "cloud.fog")
        case "Clear":
            return Image(systemName: "cloud.sun")
        case "Clouds":
            return Image(systemName: "smoke")
            
        default:
            return Image(systemName: "cloud.sun")
        }
    }


}
    


 
