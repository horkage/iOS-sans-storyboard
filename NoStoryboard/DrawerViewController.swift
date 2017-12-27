//
//  DrawerViewController.swift
//  NoStoryboard
//
//  Created by Michael Wood on 12/5/17.
//  Copyright © 2017 Michael Wood. All rights reserved.
//

import UIKit
import NotificationCenter

protocol DrawerViewControllerDelegate: class {

    func didFinishTask(sender: DrawerViewController)
}

class DrawerViewController: UIViewController {
    weak var delegate: DrawerViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.brown
        
        let button = UIButton(frame: CGRect(x:0,y:0,width:100,height:50))
        view.addSubview(button)
        button.setTitle("Push", for: .normal)
        button.backgroundColor = UIColor.gray
        button.setTitleColor(UIColor.cyan, for: .normal)
        button.addTarget(self, action: #selector(send), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.topAnchor.constraint(equalTo: view.topAnchor, constant: 80.0).isActive = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func send() {
        print("send")
        // NotificationCenter.default.post(name: NSNotification.Name(rawValue: "UpdateLabelNotification"), object: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
