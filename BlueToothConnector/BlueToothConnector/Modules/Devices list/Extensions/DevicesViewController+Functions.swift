//
//  DevicesViewController+Functions.swift
//  BlueToothConnector
//
//  Created by Rost on 14.01.2020.
//  Copyright © 2020 Rost Gress. All rights reserved.
//

import Foundation
import UIKit
import CoreBluetooth


extension DevicesViewController {
    
    
    func setupUI() {
        startBarItem.isEnabled = false
        
        devicesTable.tableFooterView = UIView()
    }
    
    
    @objc func deviceDidFound(_ sender: Notification) {
        if let info = sender.userInfo {
            print("User info -> ", info)
            
            if let device = info["device"] as? CBPeripheral {
                if !devicesArray.contains(device) {
                    devicesArray.append(device)
                }
            }
            
            devicesTable.reloadData()
        }
    }
    
    
    @objc func managerIsReady(_ sender: Notification) {
        if let info = sender.userInfo {
            if let status = info["status"] {
                startBarItem.isEnabled = status as! Bool
            } else {
                print("Bluetooth is off.")
            }
        }
    }
}
