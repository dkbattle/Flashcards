//
//  CreationViewController.swift
//  Flashcards
//
//  Created by Mac on 10/27/18.
//  Copyright © 2018 Donald Battle. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {
    
    @IBOutlet weak var questionTextField: UITextField!
    
    @IBOutlet weak var answerTextField: UITextField!
    
    var flashcardsController: ViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func didTapOnCancel(_ sender: Any) {
        
        dismiss(animated: true)
    }
    @IBAction func didTapOnDone(_ sender: Any) {
        //get the text in question text field
    let questionText = questionTextField.text
    
    //Get the text in answer text field
    let answerText = answerTextField.text
        
     //Call the function to update the flashcard
        
        flashcardsController.updateFlashcard(question: questionText!, answer1: answerText!)
        
        
        // Dismiss
        
        dismiss(animated: true)
    
        
    }
    
    
    /*
     @IBAction func didTapOnDone(_ sender: Any) {
     }
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
