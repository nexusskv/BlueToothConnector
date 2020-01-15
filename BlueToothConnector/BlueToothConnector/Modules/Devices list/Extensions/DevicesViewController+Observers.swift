//
//  DevicesViewController+Observers.swift
//  BlueToothConnector
//
//  Created by Rost on 14.01.2020.
//  Copyright © 2020 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension DevicesViewController {
    
    func addObservers() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(managerIsReady),
                                               name: managerReady,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(deviceDidFound),
                                               name: deviceFound,
                                               object: nil)
    }
    
    
    func removeObservers() {
        NotificationCenter.default.removeObserver(self)
    }
}
 
