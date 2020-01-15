//
//  BTManager.swift
//  BlueToothConnector
//
//  Created by Rost on 14.01.2020.
//  Copyright © 2020 Rost Gress. All rights reserved.
//

import Foundation
import UIKit
import CoreBluetooth


class BTManager: NSObject {
    var manager: CBCentralManager!
    var myDevice: CBPeripheral!

    
    override init() {
        super.init()
        
        self.manager = CBCentralManager(delegate: self, queue: .main, options: nil)
    }
}
