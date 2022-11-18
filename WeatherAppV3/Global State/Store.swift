//
//  Store.swift
//  WeatherAppV3
//
//  
//

import Foundation

class Store: ObservableObject {
    
    @Published var selectedUnit: TemperatureUnit = .celsius
    @Published var weatherList: [WeatherViewModel] = [WeatherViewModel]()
    
    
    init(){
        selectedUnit = UserDefaults.standard.unit
    }
    func addWeather(_ weather: WeatherViewModel) {
        weatherList.append(weather)
    }
}
