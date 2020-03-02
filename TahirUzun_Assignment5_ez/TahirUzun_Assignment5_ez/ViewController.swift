//
//  ViewController.swift
//  TahirUzun_Assignment5_ez
//
//  Created by Tahir Uzun on 2/24/20.
//  Copyright © 2020 Tahir Uzun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Button Controls
    var newListButtonTag:Int = 1
    var newItemButtonTag:Int = 2
    var addButtonTag:Int = 3
    
    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var DescTextField: UITextField!
    @IBOutlet weak var shoppingListTextView: UITextView!
    
    @IBAction func newList(_ sender: UIButton)
    {
        if sender.tag == newListButtonTag
        {
            quantityTextField.text = ""
            DescTextField.text = ""
            shoppingListTextView.text = "No Item"
        }
    }
    
    @IBAction func newItem(_ sender: UIButton)
    {
        if (sender.tag == newItemButtonTag)
        {
            quantityTextField.text = ""
            DescTextField.text = ""
        }
    }
    
    @IBAction func add(_ sender: UIButton)
    {
        if sender.tag == addButtonTag
        {
            if quantityTextField.text?.isEmpty == false &&  DescTextField.text?.isEmpty == false
            {
                if shoppingListTextView.text == "No Item"
                {
                    shoppingListTextView.text = ""
                }
                
                shoppingListTextView.text = quantityTextField.text! + "x " + DescTextField.text! + "\n" + shoppingListTextView.text!
            }
            if quantityTextField.text?.isEmpty == true || DescTextField.text?.isEmpty == true
            {
                let alert = UIAlertController(title: "Missing Input", message: "Make sure 'Quantity' and 'Description' fields are not empty", preferredStyle: .alert)
                let okAlert = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                
                alert.addAction(okAlert)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}

    
    
    




