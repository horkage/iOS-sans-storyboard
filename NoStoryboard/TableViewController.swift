//
//  TableViewController.swift
//  NoStoryboard
//
//  Created by Michael Wood on 12/28/17.
//  Copyright © 2017 Michael Wood. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var array: [Any] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        array.append(["id": 1, "name": "splat", "imageUrl": "http://10.1.20.130:9000/images/cucumber.jpg"])
        array.append(["id": 2, "name": "gore", "imageUrl": "http://10.1.20.130:9000/images/goldmane.jpg"])
        
        /*
         let managedContext = appDelegate.persistentContainer.viewContext
         let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
         do {
         people = try managedContext.fetch(fetchRequest)
         print("fetched people: \(people.count)")
         } catch let error as NSError {
         print("Could not fetch. \(error). \(error.userInfo)")
         }
         */

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    */

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return array.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        let guy = array[indexPath.row] as? [String: Any]
        let name = guy?["name"] as! String
        // let id = guy?["id"] as! Int
        
        let imageUrlString = guy?["imageUrl"] as! String
        let imageUrl = URL(string: imageUrlString)
        let imageData = try? Data(contentsOf: imageUrl!)
        let image = UIImage(data: imageData!)
        
        cell.cellImageView.image = image
        cell.cellLabel.text = name
        
        /*
        cell.currentDuration = guy?["currentDuration"] as! Int
        cell.totalDuration = guy?["totalDuration"] as! Int
        
        let initialProgress = Float(cell.currentDuration!) / Float(cell.totalDuration!)
        cell.progressView?.progress = initialProgress
        
        if (cell.currentDuration! >= cell.totalDuration!) {
            cell.backgroundColor = UIColor.blue
        } else {
            cell.kickOffTimer(guyId: id)
        }
        */
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected \(array[indexPath.row])")
    }

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
    func onLoadData(data: [Any]) {
        print("the right onLoadData fired")
        array = []
        for var guy in data {
            let thisGuy = guy as! [String: Any]
            let name = thisGuy["name"]
            let image = thisGuy["imageUrl"]
            
            array.append(["name": name, "imageUrl": image])
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}