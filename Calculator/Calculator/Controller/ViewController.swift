//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var numberLabel: NumberLabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        numberLabel.clearAll()
    }
    
    @IBAction func touchUpOperandButton(_ sender: OprandButton) {
        guard let number = sender.number else {
            return
        }
        numberLabel.append(number)
    }
    
    @IBAction func touchUpOperatorButton(_ sender: OperatorButton) {
        
    }
    
    @IBAction func touchUpCommandButton(_ sender: CommandButton) {
        guard let command: Command = sender.command else {
            return
        }
        switch command {
        case .AllClear:
            return
        case .ClearElement:
            return
        case .SwapNumberSign:
            numberLabel.swapNumberSign()
        case .EnterDecimalPoints:
            return
        case .calculation:
            return
        }
    }
}

