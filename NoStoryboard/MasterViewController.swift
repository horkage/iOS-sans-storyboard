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
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var people: [NSManagedObject] = []
    var increment = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // see self's extensions
        setupLayout()
        setupAppData()
        
        print(people.count)
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
