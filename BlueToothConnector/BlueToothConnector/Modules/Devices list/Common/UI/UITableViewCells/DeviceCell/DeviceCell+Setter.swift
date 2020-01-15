//
//  DeviceCell+Setter.swift
//  BlueToothConnector
//
//  Created by Rost on 14.01.2020.
//  Copyright © 2020 Rost Gress. All rights reserved.
//

import Foundation
import UIKit
import CoreBluetooth


extension DeviceCell {
    
    func setValues(_ device: CBPeripheral) {
        if let name = device.name {
            deviceTitle.text = name
        }
        
        deviceId.text = "\(device.identifier)"
        
        switch device.state {
            case .connected:
                deviceStatus.image = UIImage(named: "connection_on")
            case .disconnected:
                deviceStatus.image = UIImage(named: "connection_off")
            case .connecting, .disconnecting:
                deviceStatus.image = UIImage(named: "connection_process")
            default:
                break
        }
    }
}
