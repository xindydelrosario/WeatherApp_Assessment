//
//  WeatherListViewModel.swift
//  WeatherAppV3
//
//  
//

import Foundation
import CoreData

class WeatherListViewModel: ObservableObject {
    
    var CityName: String = ""
    @Published var city: [weatherViewModel] = []
    
    func getAllCityName() {
        city = CoreDataManager.shared.getAllCityName().map(weatherViewModel.init)
    }
    
    func delete (_ city: weatherViewModel) {
        
        let existingCity = CoreDataManager.shared.getCityById(id: city.id)
        if let existingCity = existingCity {
            CoreDataManager.shared.deleteCity(city: existingCity)
        }
    }
    
    func save() {
        let city = SearchedCity (context: CoreDataManager.shared.viewContext)
        city.searchcity = CityName
        
        CoreDataManager.shared.save()
    }
    
    
}

struct weatherViewModel {
    
    let city: SearchedCity
    
    var id: NSManagedObjectID {
        return city.objectID
    }
    
    var CityName: String {
        return city.searchcity ?? ""
    }
}
