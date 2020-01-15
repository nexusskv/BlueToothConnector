//
//  BTManager+Notifications.swift
//  BlueToothConnector
//
//  Created by Rost on 14.01.2020.
//  Copyright © 2020 Rost Gress. All rights reserved.
//

import Foundation
import CoreBluetooth


extension BTManager {
        
    func sendDevice(_ peripheral: CBPeripheral) {
        if peripheral.name != nil {
            self.myDevice = peripheral
            
            if let device = self.myDevice {
                sendNotification(deviceFound, field: "device", object: device)
            }
        }
    }
    
    
    func sendNotification(_ name: Notification.Name, field: String, object: Any) {
        NotificationCenter.default.post(name: name,
                                        object: nil,
                                        userInfo: [field: object])
    }
}
