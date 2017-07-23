//
//  Menu2.swift
//  DunkinScheduling
//
//  Created by Logan Schultz on 7/15/17.
//  Copyright © 2017 Logan Schultz. All rights reserved.
//

import UIKit
import Firebase

class Menu2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        postToDatabase()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func postToDatabase() {
        let refEmployees = Database.database().reference().child("Employees")
        let schedule : [String : String] = ["0" : "Off",
                                            "1" : "Off",
                                            "2" : "2-10",
                                            "3" : "2-10:30",
                                            "4" : "2:30-10:30",
                                            "5" : "2-10",
                                            "6" : "Off"]
        refEmployees.child("Logan").setValue(schedule)
        
        let schedule2 : [String : String] = ["0" : "Off",
                                            "1" : "Off",
                                            "2" : "Off",
                                            "3" : "Off",
                                            "4" : "2:30-10:30",
                                            "5" : "Off",
                                            "6" : "Off"]
        refEmployees.child("Caitlin").setValue(schedule2)
        
    }
}
