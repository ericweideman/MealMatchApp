//
//  LocationManager.swift
//  MealMatch
//
//  Created by Eric Weideman on 4/25/22.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject {
    
    @Published var locationManager = CLLocationManager()
    @Published var userLatitude: CLLocationDegrees = 0
    @Published var userLongitude: CLLocationDegrees = 0
    
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
    }
    
    func fetchLocationOnce() -> Void {
      if locationManager.authorizationStatus == .authorizedAlways || locationManager.authorizationStatus == .authorizedWhenInUse {
          locationManager.requestLocation()
      } else {
        locationManager.requestWhenInUseAuthorization()
      }
    }
}

extension LocationManager: CLLocationManagerDelegate {

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
      if locationManager.authorizationStatus == .authorizedAlways || locationManager.authorizationStatus == .authorizedWhenInUse {
       fetchLocationOnce()
      }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
                userLatitude = locationManager.location?.coordinate.latitude ?? 0
                userLongitude = locationManager.location?.coordinate.longitude ?? 0
            
                print("Found user's location: \(location)")
             }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
      guard let clError = error as? CLError else { return }
      switch clError {
      case CLError.denied:
        print("Access denied")
      default:
        print("Catch all errors")
      }
    }
    
}
