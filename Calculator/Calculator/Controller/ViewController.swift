//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userInputDigitsLabel: UILabel!
    @IBOutlet weak var userInputOperatorLabel: UILabel!
    
    @IBOutlet weak var dotButton: UIButton!
    @IBOutlet weak var equalButton: UIButton!
    
    @IBOutlet weak var allClearButton: UIButton!
    @IBOutlet weak var clearEntryButton: UIButton!    
    
    var calculator = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func touchUpDigitButton(_ sender: UIButton) {
        guard let titleLabel = sender.titleLabel else {
            return
        }
        guard let titleLabelText = titleLabel.text else {
            return
        }
        switch sender {
        case dotButton:
            addDot(titleLabelText)
        default:
            addNumber(titleLabelText)
        }
    }
    @IBAction func touchUpChangingUIButton(_ sender: UIButton) {
            switch sender {
            case allClearButton:
                allClear()
            case clearEntryButton:
                clearEntry()
            default:
                changePostiveOrNegativeSymbol()
            }
        }
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        guard let titleLabel = sender.titleLabel else {
            return
        }
        guard let titleLabelText = titleLabel.text else {
            return
        }
        switch titleLabelText {
        case "+":
            pushOperator(.addition)
        case "−":
            pushOperator(.subtraction)
        case "×":
            pushOperator(.mulitplication)
        case "÷":
            pushOperator(.division)
        default:
           performCalculation()
        }
    }
}

extension ViewController {
    func addDot(_ dot: String) {
        guard let currentText = userInputDigitsLabel.text else {
            return
        }
        guard !currentText.contains(dot) else {
            return
        }
        userInputDigitsLabel.text = currentText + dot
    }
    
    func addNumber(_ value: String) {
    }
    
    func allClear() {
    }
    func clearEntry() {
    }
    func changePostiveOrNegativeSymbol() {
    }
    
    func pushOperator(_ type: OperatorType) {
    }
    func performCalculation() {
    }
}
