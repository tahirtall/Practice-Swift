//
//  ViewController.swift
//  TahirUzun_Assignment8
//
//  Created by Tahir Uzun on 3/10/20.
//  Copyright © 2020 Tahir Uzun. All rights reserved.
//

import UIKit

class RiddleViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func numberOfSections(in tableview: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return riddles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let riddle = riddles[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "theRiddleCell", for: indexPath)
        
        cell.textLabel?.text = riddle.day
        cell.detailTextLabel?.text = riddle.title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let riddle = riddles[indexPath.row]
        let day = riddle.day
        let question = riddle.riddle
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let AnswerViewController = segue.destination as? AnswerViewController {
           if let indexPath = self.tableView.indexPathForSelectedRow {
               AnswerViewController.riddle = riddles[indexPath.row]
           }
       }
    }
}



