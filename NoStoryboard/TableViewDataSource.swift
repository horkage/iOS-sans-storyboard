//
//  TableViewDataSource.swift
//  NoStoryboard
//
//  Created by Michael Wood on 12/27/17.
//  Copyright © 2017 Michael Wood. All rights reserved.
//

import UIKit

class TableView: UITableView, UITableViewDataSource, UITableViewDelegate, DataSourceDelegate {
    
    var array = ["splat", "gore", "bob"]
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let value = array[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel?.text = value
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numrows")
        return array.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected \(array[indexPath.row])")
    }
    
    func onLoadData(data: [Any]) {
        print("onLoadData fired")
        array = []
        for var guy in data {
            let thisGuy = guy as! [String: Any]
            let name = thisGuy["name"]
            array.append(name as! String)
        }
        
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
