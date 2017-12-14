//
//  MasterViewController.swift
//  NoStoryboard
//
//  Created by Michael Wood on 12/5/17.
//  Copyright © 2017 Michael Wood. All rights reserved.
//

import UIKit
import CoreData

class MasterViewController: UIViewController {
    var drawer = UIView()
    var drawerIsOpen = false
    let navBar = UIView()
    
    // By declaring dataController here gives us a "strong" reference to DataTableViewController
    // If this declaration were not here (but inside the methods below, for example) then whenever
    // the user scrolls the datatable view, the data is lost
    //
    // for contrast, Interface Builder deals with this by defining outlets and actions as weak/strong
    var dataController: DataTableViewController?  // the "strong" reference
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataController = DataTableViewController()
        
        let dataView = dataController?.tableView
        dataView?.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dataView!)
        dataView?.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
        
        setupLayout()
        
        // auto layout needed all 4 constraints to work - just providing top wasn't enough
        // now the very first top cell isn't buried behind the navbar
        dataView?.topAnchor.constraint(equalTo: navBar.bottomAnchor).isActive = true
        dataView?.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        dataView?.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        dataView?.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func openDrawer() {
        view.bringSubview(toFront: self.drawer)
        UIView.animate(withDuration: 0.5, animations: {
            // divide adaptive width by 2 because drawer.CENTER.x
            let drawerWidth = self.drawer.frame.size.width / 2
            self.drawer.center.x = self.drawerIsOpen ? -drawerWidth : drawerWidth
        })
        self.drawerIsOpen = !self.drawerIsOpen
    }
    
    func clicky(sender: UIButton) {
        print("tapped thing")
        print(sender.titleLabel?.text)
    }
    
    func doTheThing() {
        print("the thing was did")
    }
    
    func save() {
        // notificiations?
        print("notificaiton?")
        var timer = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(self.doTheThing), userInfo: nil, repeats: false)
        
        /*
        print("gonna save a thing")
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Person", in: managedContext)
        
        let person = NSManagedObject(entity: entity!, insertInto: managedContext)
        
        let theName = "Splat Gore Bob \(increment)"
        person.setValue(theName, forKey: "name")
        
        do {
            try managedContext.save()
            people.append(person)
            increment = increment + 1
            print("saved things?")
            print("count: \(people.count)")
            print("inc: \(increment)")
        } catch let error as NSError {
            print("Could not save. \(error).  \(error.userInfo)")
        }
        // appDelegate.persistentContainer.setValue("myvalue", forKey: "mykey")
        
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        let name = theName
        button.setTitle(name, for: .normal)
        button.setTitleColor(UIColor.cyan, for: .normal)
            
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.0)
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20.0)
            
        button.addTarget(self, action: #selector(self.clicky(sender:)), for: .touchUpInside)
            
        button.topAnchor.constraint(equalTo: lastButton.bottomAnchor).isActive = true
        
        lastButton = button
        */
    }
    
    /*
    override func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        print(people.count)
        return people.count
    }
    
    //override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("callback2")
        let person = people[indexPath.row]
        let name = person.value(forKey: "name") as! String
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = name
        // cell.backgroundColor = UIColor.white
        return cell
    }
    */
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

/*
extension MasterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        print("callback")
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = people[indexPath.row]
        let name = person.value(forKey: "name") as! String
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = name
        cell.backgroundColor = UIColor.white
        return cell
    }
}
*/

