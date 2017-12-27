//
//  WebService.swift
//  NoStoryboard
//
//  Created by Michael Wood on 12/27/17.
//  Copyright © 2017 Michael Wood. All rights reserved.
//

import Foundation

class WebService {
    static let shared = WebService()
    var delegate: DataSource?
    
    init() {
        self.delegate = DataSource.shared
    }
    
    func endpoint(url: URL) {
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
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
            
            self.delegate?.onData(data: json)
        }
        task.resume()
    }
}
