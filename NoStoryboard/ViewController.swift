//
//  ViewController.swift
//  NoStoryboard
//
//  Created by Michael Wood on 12/28/17.
//  Copyright © 2017 Michael Wood. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let navViewController = NavViewController()
    var navView: UIView?
    
    // The table view controller is initialized in DataSource because it is a delegate of DataSource
    var tableView: UITableView?
    
    let drawerViewController = DrawerViewController()
    var drawerView: UIView?
    var drawerIsOpen = false
    
    let deviceId = UIDevice.current.identifierForVendor!.uuidString
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navView = navViewController.view
        tableView = DataSource.shared.delegate?.view as? UITableView
        drawerView = drawerViewController.view
        tableView?.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        
        DataSource.shared.registerDevice(deviceId: UIDevice.current.identifierForVendor!.uuidString)
        DataSource.shared.load()
        
        layout()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func drawerClick() {
        print("drawer button still works")
    }
    
    func openDrawer() {
        print("nav button still works")
        UIView.animate(withDuration: 0.5, animations: {
            // divide adaptive width by 2 because drawer.CENTER.x
            let drawerWidth = self.drawerView!.frame.size.width / 2
            self.drawerView!.center.x = self.drawerIsOpen ? -drawerWidth : drawerWidth
            self.tableView?.alpha = self.drawerIsOpen ? 1 : 0.5
        })
        drawerIsOpen = !drawerIsOpen
    }
}
