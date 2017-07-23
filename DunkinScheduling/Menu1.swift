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
    @IBOutlet weak var workSchedule: UITableView!
    
    var names: [String] = [String]()
    var days = [String]()
    var shifts = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        days = ["Saturday", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
        names = ["Logan", "Caitlin", "Treanna"]
        workSchedule.dataSource = self
        workSchedule.delegate = self

        let ref = Database.database().reference().child("Employees").child("Logan")
    
        ref.observeSingleEvent(of: .value, with: {
            snapshot in
            self.shifts = snapshot.value as! [String]
            self.workSchedule.reloadData()
        })
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            
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
