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
// class MasterViewController: UITableViewController {
    var drawer = UIView()
    var drawerIsOpen = false
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var people: [NSManagedObject] = [] // UITableViewDataSource
    var increment = 1
    let navBar = UIView()
    var lastButton = UIButton()
    var dataController: DataTableViewController?  // this gives us a "strong" reference
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataController = DataTableViewController()
        // dataController.receiveData(data: people)
        let dataView = dataController?.tableView
        // dataView?.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        // dataView?.dataSource
        dataView?.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dataView!)
        
        //dataView?.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        //dataView?.topAnchor.constraint(equalTo: navBar.bottomAnchor)
        dataView?.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        
        
        
        // see self's extensions
        setupLayout()
        // setupAppData()
 
        // tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        

        
        /*
        var previousButton = UIButton()
        for i in 0...people.count-1 {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(button)
            let person = people[i]
            let name = person.value(forKey: "name") as! String
            button.setTitle(name, for: .normal)
            button.setTitleColor(UIColor.cyan, for: .normal)
            
            button.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20.0)
            button.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 20.0)
            
            button.addTarget(self, action: #selector(self.clicky(sender:)), for: .touchUpInside)
            
            if i == 0 {
                button.topAnchor.constraint(equalTo: navBar.bottomAnchor).isActive = true
            } else {
                button.topAnchor.constraint(equalTo: previousButton.bottomAnchor).isActive = true
            }
            
            previousButton = button
            lastButton = previousButton
        }
        */
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    func save() {
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
