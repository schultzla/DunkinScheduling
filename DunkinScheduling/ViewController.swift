//
//  ViewController.swift
//  DunkinScheduling
//
//  Created by Logan Schultz on 7/15/17.
//  Copyright © 2017 Logan Schultz. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var profileScroll: UIScrollView!
    var handle: AuthStateDidChangeListenerHandle?
    
    @IBOutlet weak var userWelcome: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let V1 : Menu1 = Menu1(nibName: "Menu1", bundle: nil)
        let V2 : Menu2 = Menu2(nibName: "Menu2", bundle: nil)
        let V3 : Menu3 = Menu3(nibName: "Menu3", bundle: nil)
        
        self.addChildViewController(V1)
        self.addChildViewController(V2)
        self.addChildViewController(V3)
        
        self.profileScroll.addSubview(V1.view)
        self.profileScroll.addSubview(V2.view)
        self.profileScroll.addSubview(V3.view)
        
        V1.didMove(toParentViewController: self)
        V2.didMove(toParentViewController: self)
        V3.didMove(toParentViewController: self)
        
        var V2Frame : CGRect = V2.view.frame
        V2Frame.origin.x = self.view.frame.width
        V2.view.frame = V2Frame
        
        var V3Frame : CGRect = V3.view.frame
        V3Frame.origin.x = 2 * self.view.frame.width
        V3.view.frame = V3Frame
        
        self.profileScroll.contentSize = CGSize(width: self.view.frame.width * 3, height: self.view.frame.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

