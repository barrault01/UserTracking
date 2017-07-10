//
//  LocationTracker.swift
//  UserTracking
//
//  Created by Antoine Barrault on 10/07/2017.
//  Copyright © 2017 Antoine Barrault. All rights reserved.
//

import UIKit
import CoreLocation

fileprivate let trackingIntervalInSeconds: TimeInterval = 2

class LocationTracker: NSObject, LocationArquiver, LocationMonitoring {

    var lastLocation: UserLocation?
    var locations: [(String, UserLocation)] = [(String, UserLocation)]()

    lazy var locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.delegate = self
        return manager
    }()

    var timer: Timer?

    func changeMonitoring(startTracking: Bool) {
        resetTimer()
        self.updateMonitoring(startTracking: startTracking)
        if startTracking {
            self.timer = Timer.scheduledTimer(withTimeInterval: trackingIntervalInSeconds,
                                              repeats: true, block: self.saveLastLocation)
        } else {
            self.showLogs()
        }
    }

}

fileprivate extension LocationTracker {

    fileprivate func resetTimer() {
        if let timer = self.timer {
            timer.invalidate()
        }
        self.timer = nil
    }

    fileprivate func saveLastLocation(timer: Timer) {
        let date = Date()
        DispatchQueue.global(qos: .background).async {
            if let location = self.lastLocation {
                self.arquiveLocation(location: location, date: date)
            }
        }
    }
}

extension LocationTracker: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let last = locations.last else {
            return
        }
        self.lastLocation = UserLocation(location: last.coordinate, accuracy: last.horizontalAccuracy)
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
