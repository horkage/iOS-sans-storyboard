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
    var delegate: TableView
    
    private init() {
        self.delegate = TableView()
    }
    
    func onData(data: [Any]) {
        print("delegate fired")
        delegate.onLoadData(data: data)
    }
}
