//
//  LocationService.swift
//  Kiwe-Task
//
//  Created by Amr Fawaz on 04/08/2023.
//

import Foundation
import CoreLocation

class LocationService: NSObject, CLLocationManagerDelegate {

    // MARK: - Properties
    private let locationManager = CLLocationManager()
    private var completion: ((CLLocationCoordinate2D?, Error?) -> Void)?

    // MARK: - Public Methods
    func getLocation(completion: @escaping (CLLocationCoordinate2D?, Error?) -> Void) {
        self.completion = completion
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    // MARK: - CLLocationManagerDelegate Methods
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            completion?(nil, LocationError.noLocationAvailable)
            return
        }
        completion?(location.coordinate, nil)
        locationManager.delegate = nil
        locationManager.stopUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        completion?(nil, error)
    }
}

enum LocationError: Error {
    case noLocationAvailable
}
