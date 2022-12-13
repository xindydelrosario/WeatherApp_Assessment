//
//  Store.swift
//  WeatherAppV3
//
//  
//

import Foundation

class Store: ObservableObject {
    
    @Published var selectedUnit: TemperatureUnit = .celsius
    @Published var weatherList: [WeatherViewModel] = []
    @Published var currentW: [WeatherViewModel] = []
    
    
    init(){
        selectedUnit = UserDefaults.standard.unit
    }
    func addWeather(_ weather: WeatherViewModel) {
        weatherList.append(weather)
        saveWeather()
    }
    

    func updateWeather(_ weather: WeatherResponse) {
        guard let index = weatherList.firstIndex(where: { $0.id == weather.id}) else { return }
        weatherList[index] = weather
        saveWeather()
    }
    
    func deleteWeather(at indexSet: IndexSet) {
        weatherList.remove(atOffsets: indexSet)
        saveWeather()
    }
    
    func loadWeather() {
        FileManager().readDocument(docName: weatherFile) { (result) in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    weatherList = try decoder.decode([ForecastViewModel].self, from: data)
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func saveWeather() {
        print("Saving weatherList to file system")
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(weatherList)
            let jsonString = String(decoding: data, as: UTF8.self)
            FileManager().saveDocument(contents: jsonString, docName: weatherFile) { (error) in
                if let error = error {
                    print(error.localizedDescription)
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // MARK: - Current Weather Location

    func addCurrent(_ weather: WeatherResponse) {
        currentW.append(weather)
        saveCurrent()
    }
    
    func updateCurrent(_ weather: WeatherResponse) {
        guard let index = currentW.firstIndex(where: { $0.id == myWeather.id}) else { return }
        currentW[index] = myWeather
        saveCurrent()
    }
    
    func deleteCurrent(at indexSet: IndexSet) {
        currentW.remove(atOffsets: indexSet)
        saveCurrent()
    }
    
    func loadCurrent() {
        FileManager().readDocument(docName: currentFile) { (result) in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    currentW = try decoder.decode([ForecastViewModel].self, from: data)
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func saveCurrent() {
        print("Saving currentW to file system")
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(currentW)
            let jsonString = String(decoding: data, as: UTF8.self)
            FileManager().saveDocument(contents: jsonString, docName: currentFile) { (error) in
                if let error = error {
                    print(error.localizedDescription)
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
