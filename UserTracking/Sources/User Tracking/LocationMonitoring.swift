//
//  LocationMonitoring.swift
//  UserTracking
//
//  Created by Antoine Barrault on 10/07/2017.
//  Copyright © 2017 Antoine Barrault. All rights reserved.
//

import CoreLocation

protocol LocationMonitoring {
    var locationManager: CLLocationManager { get set }
    func updateMonitoring(startTracking: Bool)
}

extension LocationMonitoring {

    func updateMonitoring(startTracking: Bool) {
        if startTracking {
            startMonitoring()
        } else {
            stopMonitoring()
        }
    }

    fileprivate func startMonitoring() {
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.startUpdatingLocation()
        self.locationManager.allowsBackgroundLocationUpdates = true
    }

    fileprivate func stopMonitoring() {
        self.locationManager.stopUpdatingLocation()
    }

}
