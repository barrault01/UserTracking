//
//  UserLocation.swift
//  UserTracking
//
//  Created by Antoine Barrault on 10/07/2017.
//  Copyright © 2017 Antoine Barrault. All rights reserved.
//

import UIKit
import CoreLocation

class UserLocation: NSObject {
    var latitude: CLLocationDegrees
    var longitude: CLLocationDegrees
    var accuracy: CLLocationAccuracy
    var device: String

    init(location: CLLocationCoordinate2D, accuracy: CLLocationAccuracy) {
        self.latitude = location.latitude
        self.longitude = location.longitude
        self.accuracy = accuracy
        self.device = UIDevice.current.model
    }

    func jsonRepresentation() -> [String: Any] {
        return ["latitude": self.latitude,
                "longitude": self.longitude,
                "accuracy": self.accuracy,
                "device": self.device
        ]
    }
}
