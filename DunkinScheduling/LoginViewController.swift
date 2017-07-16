//
//  LoginViewController.swift
//  DunkinDuties
//
//  Created by Logan Schultz on 7/15/17.
//  Copyright © 2017 Logan Schultz. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController : UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPass: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userEmail.delegate = self
        userPass.delegate = self
        registerButton.isUserInteractionEnabled = false
        loginButton.isUserInteractionEnabled = false
        registerButton.alpha = 0.5
        loginButton.alpha = 0.5
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (userEmail.text?.isEmpty)!, (userPass.text?.isEmpty)! {
            registerButton.isEnabled = false
            loginButton.isEnabled = false
            registerButton.isUserInteractionEnabled = false
            loginButton.isUserInteractionEnabled = false
            registerButton.alpha = 0.5
            loginButton.alpha = 0.5
        } else {
            registerButton.isEnabled = true
            loginButton.isEnabled = true
            registerButton.isUserInteractionEnabled = true
            loginButton.isUserInteractionEnabled = true
            registerButton.alpha = 1.0
            loginButton.alpha = 1.0
        }
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
                    self.displayView(Identifier: "Profile")
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
        self.present(newViewController, animated: true, completion: nil)
    }
    
}

