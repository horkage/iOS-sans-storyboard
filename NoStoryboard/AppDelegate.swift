//
//  AppDelegate.swift
//  NoStoryboard
//
//  Created by Michael Wood on 12/1/17.
//  Copyright © 2017 Michael Wood. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var guyObjects = [Guy]()


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        

        let homeViewController = MasterViewController()
        // homeViewController.dataProvider = CustomDataProvider()
        window!.rootViewController = homeViewController
        window!.makeKeyAndVisible()
        
        // network request cruft
        //
        // define endpoint (this endpoint responds with a JSON array of objects)
        //
        let endpoint: String = "http://10.1.20.130:9000/getGuys"
        guard let url = URL(string: endpoint) else {
            print("Can't create URL")
            return false
        }
        
        // define request using endpoint
        //
        let urlRequest = URLRequest(url: url)
        let session = URLSession.shared
        
        // define a datatask for this shared session
        //
        let task = session.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else {
                print("Bail out: couldn't GET \(endpoint)")
                return
            }
            
            // safely extract data from response object
            //
            guard let responseData = data else {
                print("No data recieved")
                return
            }
            
            // do application-y stuff with the response data, namely, convert it from raw JSON into swift-y objects
            //
            do {
                // parse the server's JSON response array data into a swift JSON array object
                //
                guard let guys = try JSONSerialization.jsonObject(with: responseData, options: [])
                    as? [Any] else {
                        print("error trying to convert data to JSON (1)")
                        return
                }
                
                // iterate over the "constituted" swift array
                //
                for (guy) in guys {
                    // "cast" each element of the array from JSON hash into swift dictionary object
                    //
                    guard let thisGuy = guy as? [String: Any] else {
                        print("couldn't extract guy")
                        return
                    }
                    
                    // Yay! Goodies!  (deliberately block main thread here. no point in async'ing this for an app w/o data..)
                    let name = thisGuy["name"] as? String
                    
                    let imageUrlString = thisGuy["imageUrl"] as! String
                    let imageUrl = URL(string: imageUrlString)
                    let imageData = try? Data(contentsOf: imageUrl!)
                    let image = UIImage(data: imageData!)
                    var guy = Guy()
                    guy.name = name!
                    guy.image = image!
                    self.guyObjects.append(guy)
                    
                    // async this at some point:
                    /*
                    let url = URL(string: image.url)
                    
                    DispatchQueue.global().async {
                        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                        DispatchQueue.main.async {
                            imageView.image = UIImage(data: data!)
                        }
                    }
                    */
                }
                let dataController = DataTableViewController()
                DispatchQueue.main.async {
                    dataController.tableView.reloadData()
                }
                
                
            } catch {
                print("error converting requestData to JSON (2)")
                return
            }
        }
        
        // kick-off the async session data task
        //
        task.resume()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "NoStoryboard")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

