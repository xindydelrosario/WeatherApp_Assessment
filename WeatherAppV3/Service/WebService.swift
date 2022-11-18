//
//  WebService.swift
//  WeatherAppV3
//
//  
//

import Foundation

        // HTTP REQUEST KUNIN YUNG DATA FROM URL PAPAPUNTANG APP
final class NetworkManager<T: Codable> {
    static func fetchWeather(for url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) { 
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            // DATA
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            //SERVER
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            // TRANSPO
            guard error == nil else {
                print(String(describing: error))
                if let error = error?.localizedDescription {
                    completion(.failure(.error(err: error)))
                }
                return
            }
            
            // URL DECODER
            do {
                let json = try JSONDecoder().decode(T.self, from: data)
                completion(.success(json))
            } catch let err {
                print(String(describing: err))
                completion(.failure(.decodingError(err: err.localizedDescription)))
            }
        }.resume()
    }
}

enum NetworkError: Error {
    case invalidResponse
    case invalidData
    case decodingError(err: String)
    case error(err: String)
}

//: JDECODER
