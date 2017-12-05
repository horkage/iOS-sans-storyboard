//
//  DrawerViewController.swift
//  NoStoryboard
//
//  Created by Michael Wood on 12/5/17.
//  Copyright © 2017 Michael Wood. All rights reserved.
//

import UIKit

class DrawerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.frame = CGRect(x: -200, y: 100, width: 200, height: 200)
        self.view.backgroundColor = UIColor.brown

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    
    //override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        // print("HORK")
        /*
        print(UIDeviceOrientation.portrait)
        if UIDevice.current.orientation.isLandscape {
            print("landscape")
        } else {
            print("portrait")
        }
        */
    //}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
