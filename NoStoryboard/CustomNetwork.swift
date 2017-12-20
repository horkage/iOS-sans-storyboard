//
//  CustomNetwork.swift
//  NoStoryboard
//
//  Created by Michael Wood on 12/19/17.
//  Copyright © 2017 Michael Wood. All rights reserved.
//

// import Foundation

import UIKit

class CustomNetwork {
    
    static let baseUrl = URL(string: "http://10.1.20.130:9000")
    static let detailUrl = URL(string: "\(String(describing: CustomNetwork.baseUrl!))/getGuy")
    
    static func getGuys() -> [Any?] {
        let endpoint = URL(string: "\(CustomNetwork.baseUrl!)/getGuys")
        return([ ["this":"that"], ["the":"otherThing"] ])
    }
    
    static func getDetails(id: Int) -> [String: Any?] {
        let id = String(id)
        let endPoint = URL(string: "\(CustomNetwork.detailUrl!)/\(id)")
        print(endPoint!)
        /*
        let task = URLSession.shared.dataTask(with: endPoint!) {(data, response, error) in
            guard error == nil else {
                print("couldn't hit url")
                return
            }
        
            guard let content = data else {
                print("No data")
                return
            }
        
            guard let json = (try? JSONSerialization.jsonObject(with: content, options: .mutableContainers)) as? [Any] else {
                print("couldn't parse JSON")
                return
            }
        
            // self.appDelegate.theGoods = json
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
 
        }
        task.resume()
        */
        return(["key": "value"])
    }
}
