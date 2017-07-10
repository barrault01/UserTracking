//
//  LocationArquiver.swift
//  UserTracking
//
//  Created by Antoine Barrault on 10/07/2017.
//  Copyright © 2017 Antoine Barrault. All rights reserved.
//

import UIKit
import RNCryptor

fileprivate let encryptionPassword = "myPassword"

protocol LocationArquiver {
    var locations: [(String, UserLocation)] { get set }
    func arquiveLocation(location: UserLocation, date: Date)
    func showLogs()
}

extension LocationTracker {

    func arquiveLocation(location: UserLocation, date: Date) {
        self.locations.append((date.dateInStringInISO8601(), location))
    }

    func encryptData() -> Data? {
        if let data = self.createJSONData() {
            return RNCryptor.encrypt(data: data, withPassword: encryptionPassword)
        }
        return nil
    }

    func createJSONData() -> Data? {

        var json = locations.map { (date, location) -> [String : Any] in
            var dict = location.jsonRepresentation()
            dict["date"] = date
            return dict
        }
        // swiftlint:disable force_try force_cast
        // this sort the result using accuracy
        json.sort(by: { $0["accuracy"] as! Double > $1["accuracy"] as! Double })
        // swiftlint:enable force_try force_cast

        return try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
    }

    func showLogs() {

        print("########## We encrypted the results ##########")
        if let encryptedData = encryptData() {

            //TODO:
            print("########## We can save this encrypted data to a file with FileManager ##########")
            print("########## We can read the data from the file ##########")

            print("########## We decrypted the data the results ##########")
            if  let data = try? RNCryptor.decrypt(data: encryptedData, withPassword: encryptionPassword),
                let str = String(data: data, encoding: .utf8) {
                print(str)
            }
        }
    }

}

fileprivate extension Date {

    private static let formatter = ISO8601DateFormatter()

    func dateInStringInISO8601() -> String {
        return Date.formatter.string(from: self)
    }
}
