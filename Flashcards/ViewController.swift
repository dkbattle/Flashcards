//
//  ViewController.swift
//  Flashcards
//
//  Created by Mac on 10/13/18.
//  Copyright © 2018 Donald Battle. All rights reserved.
//

import UIKit

struct Flashcard {
    
    var question: String
    
    var answer: String
}

class ViewController: UIViewController {
    
    
   
    @IBOutlet weak var card: UIView!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answer: UILabel!
    
    @IBOutlet weak var btnOptionOne: UIButton!
    
    @IBOutlet weak var btnOptiontwo: UIButton!
    
    @IBOutlet weak var btnOptionThree: UIButton!
    
    @IBOutlet weak var prevButton: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    //Array to hold our flashcards
    
    var flashcards = [Flashcard]()
    
    //Current flashcard index
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        updateFlashcard(question: "What programming language is used when working with Xcode?", answer1: "Swift")
        
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
        
        
        //read saved flashcards
        readSavedFlashcards()
        
        //Adding our initial flashcard if needed
        
        if flashcards.count == 0 {
            updateFlashcard(question: "What programming language is used when working with Xcode?", answer1: "Swift")
        }else {
            updateLabels()
            updateNextPrevButtons()
        }
    
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
        
        flipFlashcard()
    }
    
    func animateCardOut() {
        UIView.animate(withDuration: 0.3, animations:{ self.card.transform = CGAffineTransform.identity.translatedBy(x: -300.0, y: 0.0)}, completion: { finished in })
        
        //update labels
        self.updateLabels()
        
        // Run other animation
        self.animateCardIn()
    }
    
    func animateCardIn() {
        
        // Start on the right side (don't animate this
        
        card.transform = CGAffineTransform.identity.translatedBy(x: 300.0, y: 0.0)
        
        // Animate card going back to its original
        
        UIView.animate(withDuration: 0.3){
            self.card.transform = CGAffineTransform.identity
        }
    }
    
    func flipFlashcard() {
        
        UIView.transition(with: card, duration: 0.3, options: .transitionFlipFromRight, animations: {
            self.questionLabel.isHidden = true
        })
        questionLabel.isHidden = true
        btnOptiontwo.isHidden = false
        btnOptionThree.isHidden = false
        
        
    }
    
    @IBAction func didTapOnPrev(_ sender: Any) {
        
        animateCardIn()
        
        //decrease current index
        currentIndex = currentIndex - 1
        
        // Update labels
        
        updateLabels()
        
        // Update buttons
        updateNextPrevButtons()
        
        
    }
    @IBAction func didTapOnNext(_ sender: Any) {
        
        animateCardOut()
        
        //Increase current index
        currentIndex = currentIndex + 1
        
        // Update labels
        
        updateLabels()
        
        // Update buttons
        updateNextPrevButtons()
        
        
    }
    
    func updateNextPrevButtons() {
        
        //Disable next button if at the end
        
        if currentIndex == flashcards.count - 1 {
            nextButton.isEnabled = false
        } else {
            nextButton.isEnabled = true
        }
        
        // Display prev button if at the beginning
        
        if currentIndex == flashcards.count - flashcards.count {
            prevButton.isEnabled = false
        } else {
            prevButton.isEnabled = true
        }
    }
    
    func saveAllFlashcardsToDisk() {
        
        //From flashcard array to dictionary array
        
        let dictionaryArray = flashcards.map { (card) -> [String: String] in
            return ["question": card.question, "answer": card.answer]
        }
        
        
        // Save array on disk using UserDefaults
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
        
        
        //Log it
        
        print("🎉 Flashcards saved to UserDefaults")
    }
    
    func readSavedFlashcards() {
        
        //Read dictionary array from disk (if any)
        
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String: String]]{
            
            
            //In here we know for sure we have a dictionary array
            let savedCards = dictionaryArray.map { dictionary -> Flashcard in
                return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!)
            }
            
            //put all these cards in our flashcards array
            flashcards.append(contentsOf: savedCards)
        }
        
        
        
    }
    
    func updateLabels() {
        
        // Get current flashcard
        
        let currentFlashcard = flashcards[currentIndex]
        
        // Update labels
        
        questionLabel.text = currentFlashcard.question
        answer.text = currentFlashcard.answer
    }
    
    
    func updateFlashcard(question: String, answer1: String) {
        
        let flashcard = Flashcard(question: question, answer: answer1)
      
        
        //adding flashcard in the flashcards array
        
        flashcards.append(flashcard)
        
        //Logging to the console
        print("😎 Added new flashcard")
        print("😎 We now have \(flashcards.count) flashcards")
        
        // Update current index
        currentIndex = flashcards.count - 1
        
        print("😎 Our current index is \(currentIndex)")
        
        
        // update buttons
        updateNextPrevButtons()
        
        // Update buttons
        
        updateLabels()
        
        
        
        
        dismiss(animated: true)
        
       
        
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        
        let creationController = navigationController.topViewController as! CreationViewController
        
        creationController.flashcardsController = self
    }

}

