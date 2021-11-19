//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by yeha on 2021/11/18.
//

import UIKit

class ViewController: UIViewController {
    
    var inputOperand: String = "0"
    var inputOperator: String = "0"
    var inputOperationQueue: String = ""
    
    @IBOutlet weak var presentOperandLable: UILabel!
    @IBOutlet weak var presentOperatorLable: UILabel!
    
    @IBAction func didNumberButtonTap(sender: UIButton) {
        let buttonTitle = sender.currentTitle
        if inputOperand != "0" {
            inputOperand += buttonTitle ?? ""
        } else if inputOperand == "0" && buttonTitle != "00" {
            inputOperand = buttonTitle ?? ""
        }
        presentOperandLable.text! = inputOperand
        inputOperationQueue += inputOperator
        inputOperator = "0"
    }
    @IBAction func didDecimalPointButtonTap (sender: UIButton) {
        if inputOperand.last != "." && !inputOperand.contains(".") {
            inputOperand += "."
            presentOperandLable.text! = inputOperand
        }
    }
    @IBAction func didOperatorButtonTap (sender: UIButton) {
        var buttonTitle = sender.currentTitle
        if buttonTitle == "-" {
            buttonTitle = "_"
        }
        inputOperator = buttonTitle ?? ""
        if inputOperand != "0" {
            inputOperationQueue += inputOperand
            inputOperand = "0"
        }
        presentOperatorLable.text! = inputOperator
        presentOperandLable.text! = "0"
    }
    @IBAction func didAllClearButtonTap (sender: UIButton) {
        clearAllLableAndQueue()
    }
    @IBAction func didClearEntryButtonTap (sender: UIButton) {
        if !inputOperand.isEmpty && inputOperand != "0" {
            inputOperand.removeLast()
            presentOperandLable.text = inputOperand
        }
    }
    @IBAction func didChangeSignButtonTap (sender: UIButton) {
        if inputOperand.hasPrefix("-") {
            inputOperand.removeFirst()
        } else {
            let temp = inputOperand
            inputOperand = "-" + temp
        }
    }
    @IBAction func didEqualsSignButtonTap (sender: UIButton) {
        if inputOperand != "0" {
            inputOperationQueue += inputOperand

            var formula = ExpressionParser.parse(from: inputOperationQueue)
            let result = String(formula.result())
            
            clearAllLableAndQueue()
            presentOperandLable.text = result
        }
    }
    func clearAllLableAndQueue() {
        inputOperator = "0"
        inputOperand = "0"
        inputOperationQueue = ""
        presentOperandLable.text = ""
        presentOperatorLable.text = ""
    }
}
