//
//  Page2ViewController.swift
//  NoStoryboard
//
//  Created by Michael Wood on 12/4/17.
//  Copyright © 2017 Michael Wood. All rights reserved.
//

import UIKit

class Page2ViewController: UIViewController {
    var label: UILabel = UILabel(frame: CGRect(x: 100, y:300, width: 200, height: 200))

    override func viewDidLoad() {
        super.viewDidLoad()
        // view.backgroundColor = UIColor.blue
        
        let button: UIButton = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        button.backgroundColor = UIColor.black
        button.setTitle("Mabobs", for: UIControlState.normal)
        button.addTarget(self, action: #selector(self.buttonClick), for: .touchUpInside)
        self.view.addSubview(button)
        
        label.backgroundColor = UIColor.white
        label.textColor = UIColor.black
        label.text = StateStruct.page2Controller.label.text
        self.view.addSubview(label)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buttonClick() {
        let customVC = StateStruct.customController
        customVC.label.text = "page 2 dismissed"
        
        self.dismiss(animated: true, completion: { () in
            StateStruct.page2Controller = self
        })
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
