//
//  ViewController+Layout.swift
//  NoStoryboard
//
//  Created by Michael Wood on 12/28/17.
//  Copyright © 2017 Michael Wood. All rights reserved.
//

import UIKit

extension ViewController {
    func layout() {
        view.addSubview(navView!)
        navView!.translatesAutoresizingMaskIntoConstraints = false
        navView!.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        navView!.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.20).isActive = true
        navView!.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        let buttonOpenMenu = UIButton(frame: CGRect(x: 10, y: 30, width: 50, height: 50))
        navView!.addSubview(buttonOpenMenu)
        buttonOpenMenu.titleLabel?.font = UIFont(name: "FontAwesome", size: 24.0)
        buttonOpenMenu.setTitle("\u{f0c9}", for: .normal)
        buttonOpenMenu.backgroundColor = UIColor.gray
        buttonOpenMenu.setTitleColor(UIColor.cyan, for: .normal)
        buttonOpenMenu.addTarget(self, action: #selector(self.openDrawer), for: .touchUpInside)
        buttonOpenMenu.translatesAutoresizingMaskIntoConstraints = false
        buttonOpenMenu.leadingAnchor.constraint(equalTo: navView!.leadingAnchor, constant: 10.0).isActive = true
        buttonOpenMenu.centerYAnchor.constraint(equalTo: navView!.centerYAnchor).isActive = true
        
        view.addSubview(tableView!)
        tableView!.translatesAutoresizingMaskIntoConstraints = false
        tableView!.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        tableView!.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        tableView!.topAnchor.constraint(equalTo: navView!.bottomAnchor).isActive = true
        
        view.addSubview(drawerView!)
        drawerView?.translatesAutoresizingMaskIntoConstraints = false
        drawerView?.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75).isActive = true
        drawerView?.topAnchor.constraint(equalTo: navView!.bottomAnchor).isActive = true
        drawerView?.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        drawerView?.trailingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        let drawerButton = UIButton()
        drawerView?.addSubview(drawerButton)
        drawerButton.translatesAutoresizingMaskIntoConstraints = false
        drawerButton.setTitle("tap", for: .normal)
        drawerButton.centerXAnchor.constraint(equalTo: (drawerView?.centerXAnchor)!).isActive = true
        drawerButton.centerYAnchor.constraint(equalTo: (drawerView?.centerYAnchor)!).isActive = true
        drawerButton.addTarget(self, action: #selector(self.drawerClick), for: .touchUpInside)
    }
}
