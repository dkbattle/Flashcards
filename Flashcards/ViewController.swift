//
//  ViewController.swift
//  Flashcards
//
//  Created by Mac on 10/13/18.
//  Copyright © 2018 Donald Battle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var answerLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func didTapOnFlashcard(_ sender: Any) {
        
        questionLabel.isHidden = true
    }
    
    
}

