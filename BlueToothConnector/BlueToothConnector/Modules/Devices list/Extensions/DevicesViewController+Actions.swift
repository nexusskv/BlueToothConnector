//
//  DevicesViewController+Actions.swift
//  BlueToothConnector
//
//  Created by Rost on 14.01.2020.
//  Copyright © 2020 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension DevicesViewController {
    
    @IBAction func startSearch() {
        btManager.findDevices()
    }
    
    
    @IBAction func stopSearch() {
        btManager.stopSearch()
    }
}
