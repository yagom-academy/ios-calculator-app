//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
//MARK: - IBOutlet
    @IBOutlet weak var numberLabel: NumberLabel!
    @IBOutlet weak var operatorLabel: OperatorLabel!
    @IBOutlet weak var formulaStackView: FormulaStackView!
    @IBOutlet weak var scrollView: UIScrollView!
//MARK: - Properties
    private var initializationList: [InitializationProtocol] = []
    private var isCalculated: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializationList = [numberLabel, operatorLabel, formulaStackView]
        Initialization()
    }
//MARK: - IBAction
    @IBAction func touchUpOperandButton(_ sender: OprandButton) {
        checkCalculated()
        
        guard let number = sender.number else {
            return
        }
        
        numberLabel.append(number)
    }
    
    @IBAction func touchUpOperatorButton(_ sender: OperatorButton) {
        checkCalculated()
        
        if numberLabel.isReceiving == true {
            appendFormulaIntoStackView()
            numberLabel.Initialization()
        }
        
        operatorLabel.text = sender.operatorSign
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
            if isCalculated == false{
                numberLabel.swapNumberSign()
            }
        case .EnterDecimalPoints:
            numberLabel.appendDecimalPoints()
        case .calculation:
            if isCalculated == false {
                appendFormulaIntoStackView()
                calculateFormula()
            }
        }
    }
//MARK: - Method
    private func Initialization() {
        initializationList.forEach {
            $0.Initialization()
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
        
        operatorLabel.Initialization()
        isCalculated = true
    }
    
    private func checkCalculated() {
        if isCalculated == true {
            Initialization()
            isCalculated = false
        }
    }
}

