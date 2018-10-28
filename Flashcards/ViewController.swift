//
//  ViewController.swift
//  Flashcards
//
//  Created by Mac on 10/13/18.
//  Copyright © 2018 Donald Battle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
   
    @IBOutlet weak var card: UIView!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answer: UILabel!
    
    @IBOutlet weak var btnOptionOne: UIButton!
    
    @IBOutlet weak var btnOptiontwo: UIButton!
    
    @IBOutlet weak var btnOptionThree: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        questionLabel.layer.cornerRadius = 30.0
        
        questionLabel.clipsToBounds = true
        
        answer.layer.cornerRadius = 30.0
        
        answer.clipsToBounds = true
        
        card.layer.shadowRadius = 15.0
        
        card.layer.shadowOpacity = 0.20
        
        card.layer.cornerRadius = 20.0
        
        
        
            
        btnOptionOne.layer.cornerRadius = 20
        
        btnOptionOne.layer.borderWidth = 3.0
        
        btnOptionOne.layer.borderColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        
        btnOptiontwo.layer.cornerRadius = 20
        
        btnOptiontwo.layer.borderWidth = 3.0
        
        btnOptiontwo.layer.borderColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        
        btnOptionThree.layer.cornerRadius = 20
        
        btnOptionThree.layer.borderWidth = 3.0
        
        btnOptionThree.layer.borderColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
    
    }

    @IBAction func didTapOptionThree(_ sender: Any) {
        
        btnOptionThree.isHidden = true
    }
    
    @IBAction func didTapOptiontwo(_ sender: Any) {
        
        btnOptiontwo.isHidden = true
    }
    
   
    @IBAction func didTapOptionOne(_ sender: Any) {
        
        questionLabel.isHidden = true
    }
    
    @IBAction func didTapCard(_ sender: Any) {
        
        questionLabel.isHidden = false
        btnOptiontwo.isHidden = false
        btnOptionThree.isHidden = false
        
        
    }
    func updateFlashcard(question: String, answer1: String) {
        //Do stuff here
        
        questionLabel.text = question
        
        answer.text = answer1
        
        
        dismiss(animated: true)
        
       
        
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        
        let creationController = navigationController.topViewController as! CreationViewController
        
        creationController.flashcardsController = self
    }
}

