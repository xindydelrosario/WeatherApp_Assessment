//
//  WeatherLocationViewModel.swift
//  WeatherAppV3
//
//  Created by xindy.del.rosario on 11/21/22.
//

import Foundation
import CoreLocation

class WeatherByCoordinates {
    func getCurrentWeather(latitude: CLLocationDegrees, longtitude: CLLocationDegrees) async throws {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?lat=\(latitude)&lon=\(longtitude)&appid=953add67a12dc794e7a69cde0e4a01c6&units=metric") else {
            fatalError("Missing URL")}
        
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Errir fetchng Weather data")}
    }
}
