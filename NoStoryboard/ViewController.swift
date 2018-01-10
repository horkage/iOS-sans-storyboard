//
//  ViewController.swift
//  NoStoryboard
//
//  Created by Michael Wood on 12/28/17.
//  Copyright © 2017 Michael Wood. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var navView: UIView?
    var guys = [Guy]()
    
    // The table view controller is initialized in DataSource because it is a delegate of DataSource
    var tableView: UITableView?
    
    var drawerView: UIView?
    var drawerIsOpen = false
    
    let deviceId = UIDevice.current.identifierForVendor!.uuidString
    
    override func viewDidLoad() {        
        super.viewDidLoad()
        
        navView = UIView()
        navView?.backgroundColor = .blue
        
        tableView = UITableView()
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.rowHeight = 100
        
        drawerView = UIView()
        drawerView?.backgroundColor = .green
        
        tableView?.register(TableViewCell.self, forCellReuseIdentifier: Constants.app.customCellClass)
        
        DataSource.shared.registerDevice(deviceId: deviceId)
        DataSource.shared.delegate = self
        DataSource.shared.load()
        
        layout()
    }
    
    override func viewDidLayoutSubviews() {
        // TODO
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func drawerClick() {
        print("drawer button still works")
    }
    
    /*
    typealias MyCallback = (_ callbackbar:String) -> Void
    
    func f1(callback:MyCallback) {
        var test = "Me"
       callback (test)
    })
    */
    
    func openDrawer() {
        print("nav button still works")
        UIView.animate(withDuration: 0.5, animations: {[weak self] in
            // divide adaptive width by 2 because drawer.CENTER.x
            let drawerWidth = (self?.drawerView!.frame.size.width)! / 2
            self?.drawerView!.center.x = (self?.drawerIsOpen)! ? -drawerWidth : drawerWidth
            self?.tableView?.alpha = (self?.drawerIsOpen)! ? 1 : 0.5
        })
        drawerIsOpen = !drawerIsOpen
    }
}

extension ViewController : DataSourceDelegate {    
    func onLoadData(data: [Guy]) {
        guys += data
        DispatchQueue.main.async {
            self.tableView!.reloadData()
        }
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return guys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.app.customCellClass, for: indexPath) as! TableViewCell
        let guy = guys[indexPath.row]
        cell.cellImageView.image = guy.image
        cell.cellLabel.text = guy.name
        
        /*
         cell.currentDuration = guy?["currentDuration"] as! Int
         cell.totalDuration = guy?["totalDuration"] as! Int
         
         let initialProgress = Float(cell.currentDuration!) / Float(cell.totalDuration!)
         cell.progressView?.progress = initialProgress
         
         if (cell.currentDuration! >= cell.totalDuration!) {
         cell.backgroundColor = UIColor.blue
         } else {
         cell.kickOffTimer(guyId: id)
         }
         */
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let guy = guys[indexPath.row]
        print("selected \(guy.name)")
    }

}
