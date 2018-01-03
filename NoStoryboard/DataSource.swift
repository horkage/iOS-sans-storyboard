//
//  DataSource.swift
//  NoStoryboard
//
//  Created by Michael Wood on 12/27/17.
//  Copyright © 2017 Michael Wood. All rights reserved.
//
//  This singleton is responsible for protecting the app from data access details.
// 
//  By having this DataSource "layer" the app absolutely does not care where or how
//  it gets its data - only that it gets it when it wants it.  
//  
//  Data could be sourced from disk, the network or Mars for all the app cares.

import UIKit

final class DataSource: WebServiceDelegate {
    static let shared = DataSource()
    var deviceId: String?
    var delegate: TableViewController?
    var guys: [Guy] = []
    
    private init() {
        self.delegate = TableViewController()
    }
    
    func registerDevice(deviceId: String) {
        self.deviceId = deviceId
    }
    
    // ViewController > here > web api
    func load() -> Void {
        print("load called...")
        guard let thing = URL(string: Constants.api.baseUrl) else { return }
        WebService.shared.endpoint(url: thing)
    }
    
    // web api > here > TableViewController
    func onData(data: [Any]) {
        print("delegate fired")
        // Take the raw data from the authoritative source (the server) and then translate
        // it data into proper objects for the app to use within its own domain.
        // This is the glue between server data and app data.
        
        
        for guy in data {
            let guyObject = guy as? [String: Any]
            let name = guyObject?["name"] as! String
            let id = guyObject?["id"] as! Int
            let totalDuration = guyObject?["totalDuration"] as! Int
            let currentDuration = guyObject?["currentDuration"] as! Int
            let then = guyObject?["then"] as! Int
            let now = guyObject?["now"] as! Int
        
            let imageUrlString = guyObject?["imageUrl"] as! String
            let imageUrl = URL(string: imageUrlString)
            let imageData = try? Data(contentsOf: imageUrl!)
            let image = UIImage(data: imageData!)
            
            let ephemeralGuy = Guy(id: id,
                                   name: name,
                                   image: image!,
                                   totalDuration: totalDuration,
                                   currentDuration: currentDuration,
                                   then: then,
                                   now: now)
            
            guys.append(ephemeralGuy)
        }
        
        let saved = NSKeyedArchiver.archiveRootObject(guys, toFile: Guy.ArchiveURL.path)
        
        if (saved) {
            print("saved is true?")
        } else {
            print("poop")
        }
        
        /*
        guard let guyObjects = NSKeyedUnarchiver.unarchiveObject(withFile: Guy.ArchiveURL.path) as? [Guy] else {
            print("nada")
            return
        }
        */
        
        if let happen = NSKeyedUnarchiver.unarchiveObject(withFile: Guy.ArchiveURL.path) as? [Guy] {
            let guyObjects: [Guy] = happen
            print("there is stuff?")
            print(guyObjects)
        }
        
        
        
        delegate?.onLoadData(data: data)
    }
}
