//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var numberLabel: NumberLabel!
    @IBOutlet weak var operatorLabel: OperatorLabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        numberLabel.clearAll()
        operatorLabel.clearAll()
    }
    
    @IBAction func touchUpOperandButton(_ sender: OprandButton) {
        guard let number = sender.number else {
            return
        }
        numberLabel.append(number)
    }
    
    @IBAction func touchUpOperatorButton(_ sender: OperatorButton) {
        if numberLabel.isReceiving == true {
            return
        } else {
            operatorLabel.text = sender.operatorSign
        }
    }
    
    @IBAction func touchUpCommandButton(_ sender: CommandButton) {
        guard let command: Command = sender.command else {
            return
        }
        switch command {
        case .AllClear:
            return
        case .ClearElement:
            numberLabel.clearAll()
        case .SwapNumberSign:
            numberLabel.swapNumberSign()
        case .EnterDecimalPoints:
            numberLabel.appendDecimalPoints()
        case .calculation:
            return
        }
    }
}

