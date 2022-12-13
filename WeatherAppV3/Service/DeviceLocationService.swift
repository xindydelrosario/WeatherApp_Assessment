//
//  DeviceLocationService.swift
//  WeatherAppV3
//
//  
//
import Foundation
import MapKit
import Combine
import os



//class DeviceLocationService: NSObject, CLLocationManagerDelegate ,ObservableObject {
//
//    @Published var lastSeenLocation: CLLocation?
//
//    @Published var currentPlacemark: CLPlacemark?
//
//    var coordinatesPublisher = PassthroughSubject<CLLocationCoordinate2D, Error>()
//
//    var deniedLocationAccessPublisher = PassthroughSubject<Void, Never>()
//
//    private override init () {
//        super.init()
//    }
//
//    static let shared = DeviceLocationService()
//
//    private lazy var locationManager: CLLocationManager = {
//        let manager = CLLocationManager()
//        manager.desiredAccuracy = kCLLocationAccuracyBest
//        manager.delegate = self
//        return manager
//    }()
//
//    func requestLocationUpdates() {
//        switch locationManager.authorizationStatus {
//
//        case .notDetermined:
//            locationManager.requestWhenInUseAuthorization()
//
//        case .authorizedWhenInUse, .authorizedAlways:
//            locationManager.startUpdatingLocation()
//
//        default:
//            deniedLocationAccessPublisher.send()
//        }
//    }
//
//    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
//        switch manager.authorizationStatus {
//
//        case .authorizedWhenInUse, .authorizedAlways:
//            manager.startUpdatingLocation()
//
//        default:
//            manager.stopUpdatingLocation()
//            deniedLocationAccessPublisher.send()
//        }
//    }
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let location = locations.last else {return}
//        coordinatesPublisher.send(location.coordinate)
//    }
//
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        coordinatesPublisher.send(completion: .failure(error))
//    }
//    func location(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        lastSeenLocation = locations.first
//        fetchCountryAndCity(for: locations.first)
//    }
//    func fetchCountryAndCity(for location: CLLocation?) {
//        guard let location = location else { return }
//        let geocoder = CLGeocoder()
//        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
//            self.currentPlacemark = placemarks?.first
//        }
//    }
//}
final class LocationService: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    enum Status {
        case waiting
        case available
        case denied
    }
    
    private let locationManager = CLLocationManager()
    
    @Published var status = Status.waiting
    @Published var lastLocation: CLLocation? = nil
    @Published var lastTitle: String = ""
    
    func start() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {

        if manager.authorizationStatus == .authorizedAlways || manager.authorizationStatus == .authorizedWhenInUse {
            if let location = manager.location {
                geocode(location: location)
            } else {
                status = .waiting // isn't really available yet
                manager.startUpdatingLocation()
            }
        } else if manager.authorizationStatus == .denied || manager.authorizationStatus == .restricted {
            status = .denied
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location manager has failed with error: \(error)")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            geocode(location: location)
            
            manager.stopUpdatingLocation()
        }
    }

    
    private func geocode(location: CLLocation) {
        let geocoder = CLGeocoder()
        
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            if let error = error {
                print("Could not determine 'place' for current location: \(error.localizedDescription)")
                self.lastLocation = location
                self.lastTitle = "Current Location".localized()
                self.status = .available
            }
            if let placemarks = placemarks {
                self.lastLocation = location
                self.lastTitle = placemarks.first?.name ?? "Current Location".localized()
                self.status = .available
            }
        }
    }
}
