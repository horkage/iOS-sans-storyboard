//
//  MasterViewController+AppData.swift
//  NoStoryboard
//
//  Created by Michael Wood on 12/7/17.
//  Copyright © 2017 Michael Wood. All rights reserved.
//

import CoreData

extension MasterViewController {
    func setupAppData() {
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
        do {
            people = try managedContext.fetch(fetchRequest)
            print("fetched people: \(people.count)")
        } catch let error as NSError {
            print("Could not fetch. \(error). \(error.userInfo)")
        }
    }
}
