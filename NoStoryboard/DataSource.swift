//
//  DataSource.swift
//  NoStoryboard
//
//  Created by Michael Wood on 12/27/17.
//  Copyright © 2017 Michael Wood. All rights reserved.
//

import UIKit

final class DataSource: WebServiceDelegate {
    static let shared = DataSource()
    var delegate: TableViewController?
    
    private init() {
        self.delegate = TableViewController()
    }
    
    func onData(data: [Any]) {
        print("delegate fired")
        delegate?.onLoadData(data: data)
    }
}
