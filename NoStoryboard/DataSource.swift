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

final class DataSource {
    static let shared = DataSource()
    var deviceId: String?
    
    var delegate: DataSourceDelegate?
    var guys = [Guy]()
    let archiveUrl = Constants.app.data.archiveURL.path
    
    private init() {
        
    }
    
    func registerDevice(deviceId: String) {
        self.deviceId = deviceId
    }
    
    // ViewController > here > web api
    func load() -> Void {
        let urlString = Constants.api.baseUrl + "/" + self.deviceId!
        guard let targetUrl = URL(string: urlString) else { return }
        WebService.shared.endpoint(url: targetUrl)
    }
    

}

extension DataSource : WebServiceDelegate {
    // web api > here > TableViewController
    func onData(data: [Any]) {
        // When the app launches, the server is the authoritative source - NOT the app.
        // Persiting data should only serve to optimize local UI fiddling by the user.
        // Local data will be stale and will need to be updated when the app launches.
        guard var doomedGuys = NSKeyedUnarchiver.unarchiveObject(withFile: archiveUrl) as? [Guy] else {
            print("Couldn't fish guys from archive.")
            return
        }
        
        // Bye.
        doomedGuys.removeAll()
        
        // Now, take the raw data from the authoritative source (the server) and then translate
        // its data into proper domain objects for the app to use locally.
        for guy in data {
            let guyObject = guy as? [String: Any]
            let name = guyObject?[Constants.keys.name] as! String
            let id = guyObject?[Constants.keys.id] as! Int
            let totalDuration = guyObject?[Constants.keys.totalDuration] as! Int
            let currentDuration = guyObject?[Constants.keys.currentDuration] as! Int
            let then = guyObject?[Constants.keys.then] as! Int
            let now = guyObject?[Constants.keys.now] as! Int
            
            let imageUrlString = guyObject?[Constants.keys.imageUrl] as! String
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
        
        // Save the fresh server data using NSCoder.
        // This is the authoritative data source as far as the TableViewController is concerned.
        if (NSKeyedArchiver.archiveRootObject(guys, toFile: archiveUrl)) {
            guard let storedGuys = NSKeyedUnarchiver.unarchiveObject(withFile: archiveUrl) as? [Guy] else {
                print("Couldn't fish guys out of archive.")
                return
            }
            delegate?.onLoadData(data: storedGuys)
        } else {
            print("Couldn't stuff guys into archive.")
        }
    }
}
