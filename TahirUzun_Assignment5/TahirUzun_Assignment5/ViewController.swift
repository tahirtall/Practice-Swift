//
//  ViewController.swift
//  TahirUzun_Assignment5
//
//  Created by Tahir Uzun on 2/23/20.
//  Copyright © 2020 Tahir Uzun. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var addButton:Int = 3
    var cancelButton:Int = 2

    @IBOutlet weak var addItem: UIBarButtonItem!
    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var descTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private var shoppingListItems = shoppingList.loadSampleData()

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return shoppingListItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingItemCell", for: indexPath)

        if indexPath.row < shoppingListItems.count
        {
            let item = shoppingListItems[indexPath.row]
            cell.textLabel?.text = item.quantity + item.desc

            let accessory: UITableViewCell.AccessoryType = item.done ? .checkmark : .none
            cell.accessoryType = accessory
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row < shoppingListItems.count {
            let item = shoppingListItems[indexPath.row]
            item.done = !item.done
            
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    
    @IBAction func newItemButton(_ sender: UIButton) {
        if sender.tag == addButton {
            quantityTextField.text = ""
        }
    }
    
    
}

