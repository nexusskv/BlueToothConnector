//
//  DevicesViewController.swift
//  BlueToothConnector
//
//  Created by Rost on 14.01.2020.
//  Copyright © 2020 Rost Gress. All rights reserved.
//

import Foundation
import UIKit
import CoreBluetooth





class DevicesViewController: UIViewController {
    @IBOutlet weak var devicesTable: UITableView!
    @IBOutlet weak var startBarItem: UIBarButtonItem!
    var devicesArray = [CBPeripheral]()
    var btManager: BTManager!
        
    override func viewDidLoad() {
        super.viewDidLoad()

        addObservers()
        
        setupUI()
        
        self.btManager = BTManager()
    }
    
    deinit {
        removeObservers()
    }
}
