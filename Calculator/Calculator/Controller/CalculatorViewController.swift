//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by yeha on 2021/11/18.
//

import UIKit

class ViewController: UIViewController {
    
    var currentOperand: String = "0"
    var currentOperator: String = "0"
    var operationQueue: String = ""

    @IBOutlet private weak var currentOperandLable: UILabel!
    @IBOutlet private weak var currentOperatorLable: UILabel!
    
    @IBAction func didNumberButtonTap(sender: UIButton) {
        let buttonTitle = sender.currentTitle
        
        if currentOperand != "0" {
            currentOperand += buttonTitle ?? ""
        } else if currentOperand == "0" && buttonTitle != "00" {
            currentOperand = buttonTitle ?? ""
        }
        currentOperandLable.text! = currentOperand
        operationQueue += currentOperator
        currentOperator = "0"
    }

    @IBAction func didDecimalPointButtonTap (sender: UIButton) {
        if currentOperand.last != "." && !currentOperand.contains(".") {
            currentOperand += "."
            currentOperandLable.text! = currentOperand
        }
    }

    @IBAction func didOperatorButtonTap (sender: UIButton) {
        var buttonTitle = sender.currentTitle
        if buttonTitle == "-" {
            buttonTitle = "_"
        }
        currentOperator = buttonTitle ?? ""
        if currentOperand != "0" {
            operationQueue += currentOperand
            currentOperand = "0"
        }
        currentOperatorLable.text! = currentOperator
        currentOperandLable.text! = "0"
    }

    @IBAction func didAllClearButtonTap (sender: UIButton) {
        clearAllLableAndQueue()
    }

    @IBAction func didClearEntryButtonTap (sender: UIButton) {
        if !currentOperand.isEmpty && currentOperand != "0" {
            currentOperand.removeLast()
            currentOperandLable.text = currentOperand
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
            operationQueue += currentOperand
            let result = calculate(with: operationQueue)
            clearAllLableAndQueue()
            currentOperandLable.text = result
        }
    }
    
    private func calculate(with queue: String) -> String {
        var formula = ExpressionParser.parse(from: queue)
        return String(formula.result())
    }

    func clearAllLableAndQueue() {
        currentOperator = "0"
        currentOperand = "0"
        operationQueue = ""
        currentOperandLable.text = ""
        currentOperatorLable.text = ""
    }
}
