//
//  AddWeatherViewModel.swift
//  WeatherAppV3
//
//  Created by xindy.del.rosario on 9/21/22.
//
import CoreLocation
import Foundation

class AddWeatherViewModel: ObservableObject {
    
    var city: String = ""
    
    func save(completion: @escaping (WeatherViewModel) -> Void) {
        
        WeatherViewModel().getWeather(coor: CLLocationCoordinate2D?)
        
        { (result) in
            switch result {
                case .success(let weather):
                    DispatchQueue.main.async {
                        completion(WeatherViewModel(weather: weather))
                    }
                case .failure(let error):
                    print(error)
            }
        }
        
    }
    
}
