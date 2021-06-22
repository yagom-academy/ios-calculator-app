//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var displayUserInputNumber: UILabel!
    
    var userInput: Bool = false
    
    @IBAction func numberButtonDidTap(_ sender: UIButton) {
        if userInput {
            let currentDisplay = displayUserInputNumber.text!
            displayUserInputNumber.text = currentDisplay + sender.currentTitle!
        } else {
            displayUserInputNumber.text = sender.currentTitle!
        }
        userInput = true
    }
    
    @IBAction func operatorButtonDidTap(_ sender: UIButton) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
