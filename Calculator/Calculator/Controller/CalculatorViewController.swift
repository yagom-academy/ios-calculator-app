//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    private var savedCalculatorItems: String = ""
    private let emptyString: String = ""
    private let decimalPoint: String = "."
    private let defaultOperandLabel: String = "0"
    
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    @IBAction func operandButtondidTouchUp(_ button: UIButton) {
        switch operandLabel.text! {
        case defaultOperandLabel:
            operandLabel.text = emptyString
            operandLabel.text! += button.currentTitle!
        default:
            operandLabel.text! += button.currentTitle!
        }
    }
    
    @IBAction func operatorButtonDidTouchUp(_ button: UIButton) {
        switch operatorLabel.text!.isEmpty {
        case true:
            saveCalculator(item: "\(operandLabel.text!)")
            resetOperandLable()
            operatorLabel.text = button.currentTitle
        case false:
            saveCalculator(item: "\(operatorLabel.text!)")
            saveCalculator(item: "\(operandLabel.text!)")
            resetOperandLable()
            operatorLabel.text = button.currentTitle
        }
    }
    
    @IBAction func decimalPointButtonDidTouchUp(_ button: UIButton) {
        switch operandLabel.text!.contains(decimalPoint) {
        case true:
            return
        case false:
            operandLabel.text! += button.currentTitle!
        }
    }
    
    private func saveCalculator(item: String) {
        savedCalculatorItems += " \(item)"
    }
    
    private func resetSavedCalculatorItems() {
        savedCalculatorItems = emptyString
    }
    
    private func resetOperandLable() {
        operandLabel.text = defaultOperandLabel
    }
    
    private func resetOperatorLable() {
        operatorLabel.text = emptyString
    }
}

