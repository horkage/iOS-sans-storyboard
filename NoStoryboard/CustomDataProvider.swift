//
//  CustomDataProvider.swift
//  NoStoryboard
//
//  Created by Michael Wood on 12/1/17.
//  Copyright © 2017 Michael Wood. All rights reserved.
//

import UIKit

class CustomDataProvider: NSObject, UITableViewDataSource {
    private let cellIdentifier = "Cell"

    func registerCellsForTableView(tableView: UITableView) {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath as IndexPath)
        cell.textLabel?.text = "Row: \(indexPath.row)"
        return cell
    }
}
