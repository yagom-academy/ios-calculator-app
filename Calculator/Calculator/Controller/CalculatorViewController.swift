//
//  Calculator - ViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import UIKit


class CalculatorViewController: UIViewController {
    @IBOutlet weak var formulaHistoryStackView: UIStackView!
    @IBOutlet weak var currentInputOperandLabel: UILabel!
    @IBOutlet weak var currentInputOperatorLabel: UILabel!
    
    var mathExpression: String = ""
    var currentExpression: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        resetAllExpression()
    }
    
    func updateCurrentInputLabel(from input: String) {
        let historyStackLabel = UILabel()
        historyStackLabel.text = input
        historyStackLabel.textColor = .white
        formulaHistoryStackView.addArrangedSubview(historyStackLabel)
    }
    
    func clearEntry() {
        currentExpression = ""
        currentInputOperandLabel.text = currentExpression
    }
    
    func changeSignNumber() {
        guard var number = Double(currentExpression) else {
            return
        }
        
        number = number * -1
        currentExpression = String(number)
        currentInputOperandLabel.text = currentExpression
    }
    
    @IBAction func touchUpAllClearButton(_ sender: UIButton) {
        resetAllExpression()
    }
    
    @IBAction func touchUpClearEntryButton(_ sender: UIButton) {
        clearEntry()
    }
    
    @IBAction func touchUpChangeSignButton(_ sender: UIButton) {
        changeSignNumber()
    }
    
    @IBAction func touchUpEqualButton(_ sender: UIButton) {
        guard let beforeNumber = currentInputOperandLabel.text else {
            return
        }
        
        guard let beforeOperator = currentInputOperatorLabel.text else {
            return
        }
        
        mathExpression += beforeOperator
        mathExpression += beforeNumber
        print(mathExpression)
        var resultOfCalculate = ExpressionParser.parse(from: mathExpression)
        
        do {
            mathExpression = try String(resultOfCalculate.result())
            currentInputOperandLabel.text = mathExpression
        } catch OperandsError.dividedByZero {
            currentInputOperandLabel.text = "NaN"
        } catch {
            print(error)
        }
        print(mathExpression)
        mathExpression = ""
    }
    
    @IBAction func touchUpDotButton(_ sender: UIButton) {
    }
    
    @IBAction func touchUpOperatorsButton(_ sender: UIButton) {
        guard let beforeNumber = currentInputOperandLabel.text else {
            return
        }
        
        guard let beforeOperator = currentInputOperatorLabel.text else {
            return
        }
        
        guard let operation = sender.titleLabel?.text else {
            return
        }
        
        currentInputOperatorLabel.text = operation
        
        if beforeNumber == "0" || beforeNumber == "" {
            
        } else {
            var historyStackExpression: String = ""
            historyStackExpression += beforeOperator
            historyStackExpression += beforeNumber
            mathExpression += historyStackExpression
            updateCurrentInputLabel(from: historyStackExpression)
            currentExpression = ""
            currentInputOperandLabel.text = "0"
            print(mathExpression)
        }
    }
    
    @IBAction func touchUpOperandsButton(_ sender: UIButton) {
        guard let number = sender.titleLabel?.text else {
            return
        }
        
        if number == "0" && currentInputOperandLabel.text == "0" {
            currentInputOperandLabel.text = "0"
        } else {
            currentExpression += number
            currentInputOperandLabel.text = currentExpression
        }
    }
    
    private func resetAllExpression() {
        currentInputOperandLabel.text = "0"
        currentInputOperatorLabel.text = ""
        currentExpression = ""
        mathExpression = ""
        
    }
}
