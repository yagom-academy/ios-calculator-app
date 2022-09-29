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
    private var isCalculated: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializationList = [numberLabel, operatorLabel, formulaStackView]
        Initialization()
    }
    
    @IBAction func touchUpOperandButton(_ sender: OprandButton) {
        if isCalculated == true {
            Initialization()
            isCalculated = false
        }
        guard let number = sender.number else {
            return
        }
        numberLabel.append(number)
    }
    
    @IBAction func touchUpOperatorButton(_ sender: OperatorButton) {
        if isCalculated == true {
            Initialization()
            isCalculated = false
        }
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
            formulaStackView.appendFormula(combining: operatorLabel, to: numberLabel)
            calculateFormula()
        }
    }
    
    private func Initialization() {
        initializationList.forEach {
            $0.Initialization()
        }
    }
    
    private func calculateFormula() {
        var formula: Formula = ExpressionParser.parse(from: formulaStackView.formula)
        let result: Double = formula.result()
        if result.isInfinite || result.isNaN {
            numberLabel.text = "NaN"
        } else {
            numberLabel.text = "\(result)"
        }
        operatorLabel.Initialization()
        isCalculated = true
    }
}

