//
//  GameVC.swift
//  BrainTeaser
//
//  Created by Andrew Foster on 2/6/17.
//  Copyright © 2017 Andrii Halabuda. All rights reserved.
//

import UIKit
import pop

class GameVC: UIViewController {

    @IBOutlet weak var yesBtn: CustomButton!
    @IBOutlet weak var noBtn: CustomButton!
    @IBOutlet weak var titleLbl: UILabel!
    
    var currentCard: Card!
    var cardArray = [String]()
    var num = 0
    var num1 = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        // Importing external View
        currentCard = createCardFromNib()
        currentCard.center = AnimationEngine.screenCenterPosition
        self.view.addSubview(currentCard)
        
    }
    
    @IBAction func yesPressed(_ sender: CustomButton) {
        
        if sender.titleLabel?.text == "YES" {
            checkAnswer()
            increaseNumber()
            
            print("YES pressed")
        } else {
            cardArray.append(currentCard.currentShape)
            print(cardArray)
            setTimer()
            
            titleLbl.text = "Does this card match the previous?"
        }
        
        showNextCard()
    }
    
    @IBAction func noPressed(_ sender: CustomButton) {
        checkAnswerNo()
        increaseNumber()
        showNextCard()
        print("No pressed")
    }
    
    func showNextCard() {
        
        if let current = currentCard {
            let cardToRemove = current
            currentCard = nil
    
            AnimationEngine.animateToPosition(view: cardToRemove, position: AnimationEngine.offScreenLeftPosition, completion: { (anim:POPAnimation?, finished: Bool) in
                cardToRemove.removeFromSuperview()
            })
        }
        
        if let next = createCardFromNib() {
            next.center = AnimationEngine.offScreenRightPosition
            self.view.addSubview(next)
            currentCard = next
            
            if noBtn.isHidden {
                noBtn.isHidden = false
                yesBtn.setTitle("YES", for: .normal)
            }
            
            AnimationEngine.animateToPosition(view: next, position: AnimationEngine.screenCenterPosition, completion: { (anim:POPAnimation?, finished: Bool) in
                
            })
        }
    
    }
    
    func createCardFromNib() -> Card? {
        return Bundle.main.loadNibNamed("Card", owner: self, options: nil)?[0] as? Card
    }
    
    func checkAnswer() {
        cardArray.append(currentCard.currentShape)
        print(cardArray)
        
        if cardArray[num] == cardArray[num1] {
            print("Equal")
            correctAnswer += 1
        } else {
            print("Not equals")
            wrongAnswer += 1
        }
        
        showAnswer()
    }
    
    func checkAnswerNo() {
        cardArray.append(currentCard.currentShape)
        print(cardArray)
        
        if cardArray[num] == cardArray[num1] {
            print("Equal")
            wrongAnswer += 1
        } else {
            print("Not equals")
            correctAnswer += 1
        }
        
        showAnswer()
    }
    
    func increaseNumber() {
        num += 1
        num1 += 1
    }
    
    func showAnswer() {
        print("Correct:\(correctAnswer)")
        print("Wrong:\(wrongAnswer)")
    }
    
    func setTimer() {
        _ = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { (timer) in
            
            self.performSegue(withIdentifier: "ResultVC", sender: nil)
            print("Time Over")
        }
    }
    
}
