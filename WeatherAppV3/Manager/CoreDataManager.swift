//
//  CoreDataManager.swift
//  WeatherAppV3
//
//  
//

import Foundation
import CoreData


class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    
    static let shared = CoreDataManager()
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func getCityById(id: NSManagedObjectID) -> SearchedCity? {
        do {
       return try viewContext.existingObject(with: id) as? SearchedCity
        } catch {
            return nil
        }
    }
    
    func deleteCity(city: SearchedCity) {
        viewContext.delete(city)
        save()
    }
    
    func getAllCityName() -> [SearchedCity] {
        let request: NSFetchRequest<SearchedCity> = SearchedCity.fetchRequest()
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
    }

    func save() {
        do {
         try viewContext.save()
        } catch {
            viewContext.rollback()
            print(error.localizedDescription)
        }
    }
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "WeatherCoreDataModel")
        persistentContainer.loadPersistentStores { (description,error) in
            if let error = error {
                fatalError("Unable to initializa Core Data Stack \(error)")
            }
        }
    }
}
