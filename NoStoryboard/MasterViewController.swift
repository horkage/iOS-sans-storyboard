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

        let navBar = UIView()
        view.addSubview(navBar)
        navBar.backgroundColor = UIColor.darkGray
        navBar.translatesAutoresizingMaskIntoConstraints = false
        navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        navBar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        navBar.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.20).isActive = true

        let buttonOpenMenu = UIButton(frame: CGRect(x: 10, y: 30, width: 50, height: 50))
        navBar.addSubview(buttonOpenMenu)
        buttonOpenMenu.titleLabel?.font = UIFont(name: "FontAwesome", size: 24.0)
        buttonOpenMenu.setTitle("\u{f0c9}", for: .normal)
        buttonOpenMenu.backgroundColor = UIColor.gray
        buttonOpenMenu.setTitleColor(UIColor.cyan, for: .normal)
        buttonOpenMenu.addTarget(self, action: #selector(self.openDrawer), for: .touchUpInside)
        buttonOpenMenu.translatesAutoresizingMaskIntoConstraints = false
        buttonOpenMenu.leadingAnchor.constraint(equalTo: navBar.leadingAnchor, constant: 10.0).isActive = true
        buttonOpenMenu.topAnchor.constraint(equalTo: navBar.topAnchor, constant: 10.0).isActive = true
        
        //let drawerView = DrawerViewController().view
        
        let drawerVC = DrawerViewController()
        view.addSubview(drawerVC.view)
        drawerVC.view.translatesAutoresizingMaskIntoConstraints = false
        drawerVC.view.trailingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        drawerVC.view.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75).isActive = true
        drawerVC.view.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        drawerVC.view.topAnchor.constraint(equalTo: navBar.bottomAnchor).isActive = true
        
        self.drawer = drawerVC.view
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func openDrawer() {
        print("going to deal with drawer")
        UIView.animate(withDuration: 0.5, animations: {
            // divide adaptive width by 2 because drawer.CENTER.x
            let drawerWidth = self.drawer.frame.size.width / 2
            self.drawer.center.x = self.drawerIsOpen ? -drawerWidth : drawerWidth
            
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
