//
//  AnswerViewController.swift
//  TahirUzun_Assignment8
//
//  Created by Tahir Uzun on 3/10/20.
//  Copyright © 2020 Tahir Uzun. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBOutlet weak var cellTitleLabel: UILabel!
    @IBOutlet weak var cellRiddleLabel: UILabel!
    @IBOutlet weak var cellShowAnswerButton: UIButton!
    
    var riddle: Riddle?
    override func viewWillAppear(_ animated: Bool) {
        if let r = riddle {
            cellTitleLabel.text = r.title
            cellRiddleLabel.text = r.riddle

        }
    }
    
    @IBAction func answerButton(_ sender: UIButton) {
        if let r = riddle {
            if sender.tag == 2 {
                let alertController = UIAlertController(title: "Answer:", message: r.answer, preferredStyle: .actionSheet)
                let okayAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
                alertController.addAction(okayAction)
                present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    

}






