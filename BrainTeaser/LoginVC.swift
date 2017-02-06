//
//  ViewController.swift
//  BrainTeaser
//
//  Created by Andrew Foster on 2/5/17.
//  Copyright © 2017 Andrii Halabuda. All rights reserved.
//

import UIKit
import pop

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailConstraint: NSLayoutConstraint!
    @IBOutlet weak var passwordConstraint: NSLayoutConstraint!
    @IBOutlet weak var loginBtnConstraint: NSLayoutConstraint!

    var animEngine: AnimationEngine!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.animEngine = AnimationEngine(constraints: [emailConstraint, passwordConstraint, loginBtnConstraint])
        
    }

    
    override func viewDidAppear(_ animated: Bool) {
        
        self.animEngine.animateOnScreen(delay: 1)
        
    }
    
}

