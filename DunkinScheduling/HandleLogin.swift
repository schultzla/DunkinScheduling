//
//  HandleLogin.swift
//  DunkinDuties
//
//  Created by Logan Schultz on 7/13/17.
//  Copyright © 2017 Logan Schultz. All rights reserved.
//

import UIKit
import Firebase

class HandleLogin: UIViewController {
        
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func hitLogin(_ sender: Any) {
        if !(userEmail.text?.isEmpty)!, !(userPass.text?.isEmpty)! {
            let email = userEmail.text!
            let password = userPass.text!
            Auth.auth().signIn(withEmail: email, password: password, completion: {
                user, error in
                
                if error != nil {
                    let alert = UIAlertController(title: "Error", message: "User does not exist", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: {
                        self.userPass.text = ""
                    })
                } else {
                    self.userPass.text = ""
                    self.userEmail.text = ""
                    self.displayView(Identifier: "ShiftSelection")
                }
            })
        } else {
            let alert = UIAlertController(title: "Error", message: "Please fill out both forms", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
    }
    
    @IBAction func hitRegister(_ sender: Any) {
        if !(userEmail.text?.isEmpty)!, !(userPass.text?.isEmpty)! {
            let email = userEmail.text!
            let password = userPass.text!
            Auth.auth().createUser(withEmail: email, password: password, completion: {
                user, error in
                
                if error != nil {
                    let alert = UIAlertController(title: "Error", message: "Invalid, please try again", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: {
                        self.userPass.text = ""
                    })
                } else {
                    let alert = UIAlertController(title: "User Created", message: "Please login", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            })
        } else {
            let alert = UIAlertController(title: "Error", message: "Please fill out both forms", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)

        }
    }
    
    func displayView(Identifier: String) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: Identifier)
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
}

