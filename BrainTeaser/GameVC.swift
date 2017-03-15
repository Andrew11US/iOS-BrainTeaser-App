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
    var card1: String!
    var card2: String!
    var correctAnswer = 0
    var wrongAnswer = 0
    
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
        } else {
            card1 = currentCard.currentShape
            print(card1)
            titleLbl.text = "Does this card match the previous?"
        }
        
        showNextCard()
        print("YES pressed")
    }
    
    @IBAction func noPressed(_ sender: CustomButton) {
        checkAnswer()
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
        
        card2 = currentCard.currentShape
        print(card2)
        
        if card1 == card2 {
            correctAnswer += 1
        } else {
            wrongAnswer += 1
        }
        print(correctAnswer)
        print(wrongAnswer)
    }
    
}
