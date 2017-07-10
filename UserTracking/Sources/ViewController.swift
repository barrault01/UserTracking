//
//  ViewController.swift
//  UserTracking
//
//  Created by Antoine Barrault on 10/07/2017.
//  Copyright © 2017 Antoine Barrault. All rights reserved.
//

import UIKit
import Security

class ViewController: UIViewController {

    @IBOutlet weak var startStopButton: UIButton!
    var tracker: LocationTracker!
    var isTrackingUser: Bool = false {
        didSet {
            self.startStopButton.setTitle(isTrackingUser ? "STOP" : "START", for: .normal)
            tracker.changeMonitoring(startTracking: isTrackingUser)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tracker = LocationTracker()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func didClickOnStartStopButton(_ sender: Any) {
        isTrackingUser = !isTrackingUser
    }

}
