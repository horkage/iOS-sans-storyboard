//
//  MasterViewController+Layout.swift
//  NoStoryboard
//
//  Created by Michael Wood on 12/7/17.
//  Copyright © 2017 Michael Wood. All rights reserved.
//

import UIKit

extension MasterViewController {
    func setupLayout() {
        
        // let navBar = UIView()
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
        buttonOpenMenu.centerYAnchor.constraint(equalTo: navBar.centerYAnchor).isActive = true
        
        let drawerVC = DrawerViewController()
        view.addSubview(drawerVC.view)
        drawerVC.view.translatesAutoresizingMaskIntoConstraints = false
        drawerVC.view.trailingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        drawerVC.view.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75).isActive = true
        drawerVC.view.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        drawerVC.view.topAnchor.constraint(equalTo: navBar.bottomAnchor).isActive = true
        let buttonSave = UIButton(frame: CGRect(x:0,y:0,width:100,height:50))
        drawerVC.view.addSubview(buttonSave)
        buttonSave.setTitle("Save", for: .normal)
        buttonSave.backgroundColor = UIColor.gray
        buttonSave.setTitleColor(UIColor.cyan, for: .normal)
        buttonSave.addTarget(self, action: #selector(self.save), for: .touchUpInside)
        buttonSave.translatesAutoresizingMaskIntoConstraints = false
        buttonSave.centerXAnchor.constraint(equalTo: drawerVC.view.centerXAnchor).isActive = true
        buttonSave.topAnchor.constraint(equalTo: drawerVC.view.topAnchor, constant: 20.0).isActive = true
        
        self.drawer = drawerVC.view
        
        
    }
}