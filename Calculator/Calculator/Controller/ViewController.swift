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
    @IBOutlet weak var scrollView: UIScrollView!

    private var initializationList: [InitializationProtocol] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializationList = [numberLabel, operatorLabel, formulaStackView]
        Initialization()
    }
    
    @IBAction func touchUpOperandButton(_ sender: OprandButton) {
        guard let number = sender.number else {
            return
        }
        numberLabel.append(number)
    }
    
    @IBAction func touchUpOperatorButton(_ sender: OperatorButton) {
        operatorLabel.text = sender.operatorSign
        if numberLabel.isReceiving == true {
            formulaStackView.appendFormula(combining: operatorLabel, to: numberLabel)
            numberLabel.Initialization()
            scrollView.moveToBottom()
        }
    }
    
    @IBAction func touchUpCommandButton(_ sender: CommandButton) {
        guard let command: Command = sender.command else {
            return
        }
        switch command {
        case .AllClear:
            Initialization()
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
    
    private func Initialization() {
        initializationList.forEach {
            $0.Initialization()
        }
    }
}

