//
//  DataSourceDelegate.swift
//  NoStoryboard
//
//  Created by Michael Wood on 12/27/17.
//  Copyright © 2017 Michael Wood. All rights reserved.
//

import Foundation

protocol DataSourceDelegate {
    func onLoadData(data: [Any])
}
