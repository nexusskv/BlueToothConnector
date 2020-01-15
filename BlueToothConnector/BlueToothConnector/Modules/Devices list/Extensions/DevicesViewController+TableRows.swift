//
//  DevicesViewController+TableRows.swift
//  BlueToothConnector
//
//  Created by Rost on 14.01.2020.
//  Copyright © 2020 Rost Gress. All rights reserved.
//

import Foundation
import UIKit
import CoreBluetooth


extension DevicesViewController {
    
    /// ---> Function for make custom cells based on index of row  <--- ///
    func makeCell(_ sender: UITableView, at index: IndexPath) -> UITableViewCell {
        if let cell = sender.dequeueReusableCell(withIdentifier: "DeviceCell", for: index) as? DeviceCell {
            let object = devicesArray[index.row] 
            
            cell.setValues(object)
            
            return cell
        }

        return UITableViewCell()
    }
    
    
    /// ---> Function for make custom height based on index of row  <--- ///
    func makeHeight(_ index: IndexPath) -> CGFloat {
        return 70.0
    }
    
    
    /// ---> Function for make count of rows  <--- ///
    func makeRowsCount() -> Int {
        return devicesArray.count
    }
    
    
    /// ---> Function for present details view  <--- ///
    func presentDetails(_ table: UITableView, at index: IndexPath) {
        if btManager.myDevice.state == .connected {
            btManager.disconnect(btManager.myDevice)
        } else {
            btManager.connectToDevice(btManager.myDevice)
        }        
    }
}
