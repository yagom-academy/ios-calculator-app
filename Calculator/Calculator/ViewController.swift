//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak private var operatorInput: UILabel!
    @IBOutlet weak private var numberInput: UILabel!
    @IBOutlet weak var enteredOperand: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    private var isFinishedEnteringOperands: Bool = false
    
    @IBAction func operatorButtonTapped(_ sender: UIButton) {
        
        if let senderSign = sender.currentTitle {
            operatorInput.text = senderSign
            numberInput.text = "0"
        }

    }
    
    @IBAction func numberButtonTapped(_ sender: UIButton) {
        
        guard let number = sender.currentTitle else { return }
        checkFirstDigit()
        
        if isFinishedEnteringOperands {
            guard let currentNumber = numberInput.text else  { return }
            numberInput.text = currentNumber + number
        } else {
            numberInput.text = number
        }
        isFinishedEnteringOperands = true
    }
    
    private func checkFirstDigit() {
        if numberInput.text == "0" || numberInput.text == "00" {
            numberInput.text = ""
        }
    }
    
    

}
