//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var displayUserInputNumber: UILabel!
    
    var userInput: Bool = false
    
    var inputs = UserInput()
    
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
        inputs.infix.append(displayUserInputNumber.text!)
        inputs.infix.append(sender.currentTitle!)
        userInput = false
        print(inputs.infix)
    }
    
    @IBAction func equalButtonDidTap(_ sender: UIButton) {
        inputs.infix.append(displayUserInputNumber.text!)
        print(inputs.infix)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
