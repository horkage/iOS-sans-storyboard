//
//  CustomViewController.swift
//  NoStoryboard
//
//  Created by Michael Wood on 12/1/17.
//  Copyright © 2017 Michael Wood. All rights reserved.
//

import UIKit

class CustomViewController: UITableViewController {
    var dataProvider: CustomDataProvider?
    var label: UILabel = UILabel(frame: CGRect(x: 100, y:300, width: 200, height: 200))
    
    override func viewDidLoad() {
        // view.backgroundColor = UIColor.green
        tableView.dataSource = dataProvider
        
        dataProvider?.registerCellsForTableView(tableView: tableView)
        
        let button: UIButton = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        button.backgroundColor = UIColor.black
        button.setTitle("Thingy", for: UIControlState.normal)
        button.addTarget(self, action: #selector(self.buttonClick), for: .touchUpInside)
        self.view.addSubview(button)
        
        label.backgroundColor = UIColor.white
        label.textColor = UIColor.black
        label.text = "The Label"
        self.view.addSubview(label)
    }
    
    func buttonClick() {
        let page2VC = StateStruct.page2Controller
        page2VC.label.text = "page 1 to page 2"
        page2VC.modalTransitionStyle = .flipHorizontal
        // page2VC.modalPresentationStyle = .popover
        // page2VC.modalPresentationStyle = UIModalPresentationStyle.popover
        self.present(page2VC, animated: true, completion: { () in
            StateStruct.customController = self
        })
    }
}
