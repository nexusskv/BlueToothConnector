//
//  BTManager+Interactor.swift
//  BlueToothConnector
//
//  Created by Rost on 14.01.2020.
//  Copyright © 2020 Rost Gress. All rights reserved.
//

import Foundation
import CoreBluetooth


extension BTManager {
    
    func findDevices() {
        // let services = [CBUUID(string: SERVICE1_UUID), CBUUID(string: SERVICE2_UUID)]
        manager.scanForPeripherals(withServices: nil, options: nil)
    }
    
    
    func stopSearch() {
        manager.stopScan()
    }
    
    
    func connectToDevice(_ device: CBPeripheral) {
        manager.connect(device, options: nil)
    }
    
    
    func disconnect(_ device: CBPeripheral) {
        manager.cancelPeripheralConnection(device)
    }
    
    
    func getServices(_ device: CBPeripheral) {
        device.discoverServices(nil)
    }
}
