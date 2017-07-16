//
//  Menu1.swift
//  DunkinScheduling
//
//  Created by Logan Schultz on 7/15/17.
//  Copyright © 2017 Logan Schultz. All rights reserved.
//

import UIKit
import Firebase

class Menu1: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var handle: AuthStateDidChangeListenerHandle?
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var workSchedule: UITableView!
    
    var days = [String]()
    var shifts = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        days = ["Saturday", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
        workSchedule.dataSource = self
        workSchedule.delegate = self

        let refEmployees = Database.database().reference(withPath: "Employees")
    
        refEmployees.child("Logan/July/15th").observe(.childAdded, with: {
            snapshot in
            
            let shift = snapshot.value as? String
            self.shifts.append(shift!)
            self.workSchedule.reloadData()
        })
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logoutPressed(_ sender: Any) {
        displayView(Identifier: "Login")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            self.welcomeLabel.text = "Welcome, " + (user?.email)!
            
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = shifts[indexPath.section]
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return days.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return days[section]
    }
    
    func displayView(Identifier: String) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: Identifier)
        self.present(newViewController, animated: true, completion: nil)
    }

}
