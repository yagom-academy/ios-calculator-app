//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak private var currentOperatorLabel: UILabel!
    @IBOutlet weak private var currentInputLabel: UILabel!
    @IBOutlet weak var enteredOperandLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    private var isFinishedEnteringOperands: Bool = false
    
    @IBAction func operatorButtonTapped(_ sender: UIButton) {
        
        if let senderSign = sender.currentTitle {
            currentOperatorLabel.text = senderSign
            currentInputLabel.text = "0"
        }

    }
    
    @IBAction func numberButtonTapped(_ sender: UIButton) {
        
        guard let number = sender.currentTitle else { return }
        checkFirstDigit()
        
        if isFinishedEnteringOperands {
            guard let currentNumber = currentInputLabel.text else  { return }
            currentInputLabel.text = currentNumber + number
        } else {
            currentInputLabel.text = number
        }
        isFinishedEnteringOperands = true
    }
    
    private func checkFirstDigit() {
        if currentInputLabel.text == "0" || currentInputLabel.text == "00" {
            currentInputLabel.text = ""
        }
    }

}
