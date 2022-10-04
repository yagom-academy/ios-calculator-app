//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    //MARK: - IBOutlet
    @IBOutlet weak private var numberLabel: NumberLabel!
    @IBOutlet weak private var operatorLabel: OperatorLabel!
    @IBOutlet weak private var formulaStackView: FormulaStackView!
    @IBOutlet weak private var scrollView: UIScrollView!
    //MARK: - Properties
    private var resetList: [Resettable] = []
    private var isCalculated: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetList = [numberLabel, operatorLabel, formulaStackView]
        reset()
    }
    //MARK: - IBAction
    @IBAction func touchUpOperandButton(_ sender: OperandButton) {
        checkCalculated()
        
        guard let number = sender.number else {
            return
        }
        
        numberLabel.append(number)
    }
    
    @IBAction func touchUpOperatorButton(_ sender: OperatorButton) {
        checkCalculated()
        
        if numberLabel.isReceiving == true && numberLabel.isZero == false {
            appendFormulaIntoStackView()
            numberLabel.reset()
        }
        
        operatorLabel.text = sender.operatorSign
    }
    
    @IBAction func touchUpCommandButton(_ sender: CommandButton) {
        guard let command: Command = sender.command else {
            return
        }
        
        switch command {
        case .allClear:
            reset()
        case .clearElement:
            numberLabel.reset()
        case .swapNumberSign:
            if isCalculated == false{
                numberLabel.swapNumberSign()
            }
        case .enterDecimalPoints:
            numberLabel.appendDecimalPoints()
        case .calculation:
            if isCalculated == false {
                appendFormulaIntoStackView()
                calculateFormula()
            }
        }
    }
    //MARK: - Method
    private func reset() {
        resetList.forEach {
            $0.reset()
        }
    }
    
    private func appendFormulaIntoStackView() {
        formulaStackView.appendFormula(combining: operatorLabel, to: numberLabel)
        scrollView.moveToBottom()
    }
    
    private func calculateFormula() {
        var formula: Formula = ExpressionParser.parse(from: formulaStackView.formula.filter({ $0 != ","}))
        let result: Double = formula.result()
        
        if result.isInfinite || result.isNaN {
            numberLabel.text = "NaN"
        } else {
            numberLabel.text = CalculatorNumberFormatter.shared.string(for: result)
        }
        
        operatorLabel.reset()
        isCalculated = true
    }
    
    private func checkCalculated() {
        if isCalculated == true {
            reset()
            isCalculated = false
        }
    }
}

