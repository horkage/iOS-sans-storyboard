//
//  DataSource.swift
//  NoStoryboard
//
//  Created by Michael Wood on 12/27/17.
//  Copyright © 2017 Michael Wood. All rights reserved.
//
//  This singleton is responsible for protecting data access details from the app.
//  By having this DataSource "layer" the app absolutely does not care where or how
//  it gets its data - only when.

import UIKit

final class DataSource: WebServiceDelegate {
    static let shared = DataSource()
    var deviceId: String?
    var delegate: TableViewController?
    
    private init() {
        self.delegate = TableViewController()
    }
    
    func registerDevice(deviceId: String) {
        self.deviceId = deviceId
    }
    
    func getDeviceId() -> String {
        return self.deviceId!
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
        delegate?.onLoadData(data: data)
    }
}
