//
//  DataTableViewController.swift
//  NoStoryboard
//
//  Created by Michael Wood on 12/8/17.
//  Copyright © 2017 Michael Wood. All rights reserved.
//

import UIKit
import CoreData

class DataTableViewController: UITableViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var people: [NSManagedObject] = []
    var guys = [Guy]()
    var tableArray = [Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parseJSON()
        
        guys = appDelegate.guyObjects
        
        
        // tableView.estimatedRowHeight = 200
        // tableView.dataSource = people as! UITableViewDataSource
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
        do {
            people = try managedContext.fetch(fetchRequest)
            print("fetched people: \(people.count)")
        } catch let error as NSError {
            print("Could not fetch. \(error). \(error.userInfo)")
        }
        
        self.tableView.rowHeight = 100

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // tableView.delegate = self
        // tableView.clearsContextBeforeDrawing = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func parseJSON() {
        let endPoint = URL(string: "http://10.1.20.130:9000/getGuys")
        let task = URLSession.shared.dataTask(with: endPoint!) {(data, response, error) in
            guard error == nil else {
                print("couldn't hit url")
                return
            }
            
            guard let content = data else {
                print("No data")
                return
            }
            
            guard let json = (try? JSONSerialization.jsonObject(with: content, options: .mutableContainers)) as? [Any] else {
                print("couldn't parse JSON")
                return
            }
            self.tableArray = json
            print("TABLE ARRAY")
            print(self.tableArray)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        task.resume()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("select")
        let cell = tableView.cellForRow(at: indexPath)
        // print(cell?.textLabel?.text)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        // return people.count
        print("numberOfSections")
        return 1
    }
    */

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        // return people.count
        return self.tableArray.count
        //return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = people[indexPath.row]
        let guy = self.tableArray[indexPath.row] as? [String: Any]
        
        // let name = person.value(forKey: "name") as! String
        let name = guy?["name"] as! String
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        
        // var cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        // cell.textLabel?.text = "Bob"
        
        
        cell.textLabel?.text = name
        cell.backgroundColor = UIColor.orange
        
        
        // cell.backgroundColor = UIColor.white
        return cell
    }
    
    /*
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    */

    
    /*
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        print("THIS THING WAS CALLED")
        return UITableViewAutomaticDimension
    }
 */
    
    
    /*
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        print("THIS THING WAS CALLED")
        return UITableViewAutomaticDimension
    }
    */
    
 
    /*
    func receiveData(data: [NSManagedObject]) {
        print("receive called")
        people = data
    }
    */

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
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
