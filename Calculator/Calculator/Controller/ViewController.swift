//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var numberLabel: NumberLabel!
    @IBOutlet weak var operatorLabel: OperatorLabel!
    @IBOutlet weak var formulaStackView: FormulaStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        numberLabel.Initialization()
        operatorLabel.Initialization()
        formulaStackView.Initialization()
    }
    
    @IBAction func touchUpOperandButton(_ sender: OprandButton) {
        guard let number = sender.number else {
            return
        }
        numberLabel.append(number)
    }
    
    @IBAction func touchUpOperatorButton(_ sender: OperatorButton) {
        if numberLabel.isReceiving == true {
            operatorLabel.text = sender.operatorSign
            formulaStackView.appendFormula(combining: operatorLabel, to: numberLabel)
            numberLabel.Initialization()
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
            numberLabel.Initialization()
        case .SwapNumberSign:
            numberLabel.swapNumberSign()
        case .EnterDecimalPoints:
            numberLabel.appendDecimalPoints()
        case .calculation:
            return
        }
    }
}

