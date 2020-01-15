//
//  BTManager+BluetoothDelegate.swift
//  BlueToothConnector
//
//  Created by Rost on 14.01.2020.
//  Copyright © 2020 Rost Gress. All rights reserved.
//

import Foundation
import CoreBluetooth


extension BTManager: CBCentralManagerDelegate {
        
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
            case .poweredOff:
                print("BLE has powered off")
                stopSearch()
            
                sendNotification(managerReady, field: "status", object: false)

            case .poweredOn:
                print("BLE is now powered on")
                
                sendNotification(managerReady, field: "status", object: true)

            case .resetting:
                print("BLE is resetting")
                
                sendNotification(managerReady, field: "status", object: false)
            
            case .unauthorized:
                print("Unauthorized BLE state")
            
                sendNotification(managerReady, field: "status", object: false)
                
            case .unknown:
                print("Unknown BLE state")
                
                sendNotification(managerReady, field: "status", object: false)
            
            case .unsupported:
                print("This platform does not support BLE")
            
                sendNotification(managerReady, field: "status", object: false)
            
            @unknown default:
                break
        }
    }

    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {

        if let name = peripheral.name { // RSSI is Received Signal Strength Indicator
            print("Found \"\(name)\" peripheral (RSSI: \(RSSI))")
            
            if name.contains("Mac") {
                sendDevice(peripheral)
                
                stopSearch()
            }           
        } else {
            print("Found unnamed peripheral (RSSI: \(RSSI))")
        }

        print("")
    }

    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        if let name = peripheral.name {
            print("Connected to -> ", name)
            
            sendDevice(peripheral)
        }
    }

    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        print("Did Fail To Connect -> ", peripheral.name!, error!.localizedDescription)
    }

    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        print("Disconnected from -> ", peripheral.name!)
        if peripheral.identifier == self.myDevice.identifier {
            sendDevice(peripheral)
        }
    }
/*
    func centralManager(_ central: CBCentralManager, connectionEventDidOccur event: CBConnectionEvent, for peripheral: CBPeripheral) {
        
    }

    func centralManager(_ central: CBCentralManager, didUpdateANCSAuthorizationFor peripheral: CBPeripheral) {
        print("Did Update ANCS Authorization For -> ", peripheral.name!)
    }*/
    
    /*
    func discoverCharacteristics(_ characteristicUUIDs: [AnyObject]!,
                                 forService service: CBService!) {
        
    }
    
    func discoverDescriptorsForCharacteristic(_ characteristic: CBCharacteristic!) {
        
    }
    
    func readValueForCharacteristic(_ characteristic: CBCharacteristic!) {
        
    }*/
}
