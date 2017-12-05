//
//  MasterViewController.swift
//  NoStoryboard
//
//  Created by Michael Wood on 12/5/17.
//  Copyright © 2017 Michael Wood. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {
    var drawer = UIView()
    var drawerIsOpen = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // let navBar = CGRect(x: 0, y:0, width: UIScreen.main.bounds.width, height: 100)
        let navBar = UIView(frame: CGRect(x: 0, y:0, width: UIScreen.main.bounds.width, height: 100))
        navBar.backgroundColor = UIColor.darkGray
        
        let button = UIButton(frame: CGRect(x: 10, y: 30, width: 50, height: 50))
        button.titleLabel?.font = UIFont(name: "FontAwesome", size: 24.0)
        button.setTitle("\u{f0c9}", for: .normal)
        button.backgroundColor = UIColor.gray
        button.setTitleColor(UIColor.cyan, for: .normal)
        button.addTarget(self, action: #selector(self.openDrawer), for: .touchUpInside)
        
        
        navBar.addSubview(button)
        
        self.view.addSubview(navBar)
        
        
        let drawerVC = DrawerViewController()
        self.view.addSubview(drawerVC.view)
        
        self.drawer = drawerVC.view

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func openDrawer() {
        print("going to deal with drawer")
        UIView.animate(withDuration: 0.5, animations: {
            self.drawer.center.x = self.drawerIsOpen ? -200 : 200
        })
        self.drawerIsOpen = !self.drawerIsOpen
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
