//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by yeha on 2021/11/18.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var currentOperand: String = "0"
    var currentOperator: String = "0"
    var operationBuffer: String = ""

    @IBOutlet private weak var currentOperandLabel: UILabel!
    @IBOutlet private weak var currentOperatorLabel: UILabel!
    
    @IBAction func didNumberButtonTap(sender: UIButton) {
        let buttonTitle = sender.currentTitle
        
        if currentOperand != "0" {
            currentOperand += buttonTitle ?? ""
        } else if currentOperand == "0" && buttonTitle != "00" {
            currentOperand = buttonTitle ?? ""
        }
        currentOperandLabel.text! = currentOperand
        operationBuffer += currentOperator
        currentOperator = "0"
    }

    @IBAction func didDecimalPointButtonTap (sender: UIButton) {
        if currentOperand.last != "." && !currentOperand.contains(".") {
            currentOperand += "."
            currentOperandLabel.text! = currentOperand
        }
    }

    @IBAction func didOperatorButtonTap (sender: UIButton) {
        var buttonTitle = sender.currentTitle
        if buttonTitle == "-" {
            buttonTitle = "_"
        }
        currentOperator = buttonTitle ?? ""
        if currentOperand != "0" {
            operationBuffer += currentOperand
            currentOperand = "0"
        }
        currentOperatorLabel.text! = currentOperator
        currentOperandLabel.text! = "0"
    }

    @IBAction func didAllClearButtonTap (sender: UIButton) {
        clearAllLabelAndQueue()
    }

    @IBAction func didClearEntryButtonTap (sender: UIButton) {
        if !currentOperand.isEmpty && currentOperand != "0" {
            currentOperand.removeLast()
            currentOperandLabel.text = currentOperand
        }
    }

    @IBAction func didChangeSignButtonTap (sender: UIButton) {
        if currentOperand.hasPrefix("-") {
            currentOperand.removeFirst()
        } else {
            let temp = currentOperand
            currentOperand = "-" + temp
        }
    }

    @IBAction func didEqualsSignButtonTap (sender: UIButton) {
        if currentOperand != "0" {
            operationBuffer += currentOperand
            let result = calculate(with: operationBuffer)
            clearAllLabelAndQueue()
            currentOperandLabel.text = result
        }
    }
    
    private func calculate(with queue: String) -> String {
        var formula = ExpressionParser.parse(from: queue)
        return String(formula.result())
    }

    func clearAllLabelAndQueue() {
        currentOperator = "0"
        currentOperand = "0"
        operationBuffer = ""
        currentOperandLabel.text = ""
        currentOperatorLabel.text = ""
    }
}
