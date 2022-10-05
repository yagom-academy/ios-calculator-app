//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var historyStackView: UIStackView!
    @IBOutlet private weak var historyScrollView: UIScrollView!
    let calculator: Calculator = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clearAll()
    }
    
    private func updateOperatorLabel(to string: String = "") {
        operatorLabel.text = string
    }
    
    private func updateNumberLabel(to string: String = "0") {
        numberLabel.text = string
    }
    
    private func removeAllStackView() {
        historyStackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    private func clearAll() {
        updateOperatorLabel()
        updateNumberLabel()
        removeAllStackView()
    }
    
    @IBAction func touchCalculatorButton(_ sender: UIButton) {
        guard let key: CalculatorKeypad = CalculatorKeypad(rawValue: sender.currentTitle ?? "") else {
            return
        }
        
        switch key {
        case .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .zero, .doubleZero:
            inputNumber(key.rawValue)
        case .dot:
            inputDot()
        case .add, .subtract, .multiply, .divide:
            print(key.rawValue)
        case .ac:
            clearAll()
        case .ce:
            clearEntry()
        case .plusMinus:
            changeSign()
        case .equal:
            print(key.rawValue)
        }
    }
    
    private func inputNumber(_ number: String) {
        let currentOperand = calculator.currentOperand + number
        
        calculator.updateCurrentOperand(currentOperand)
        updateNumberLabel(to: calculator.currentOperand)
    }
    
    private func changeSign() {
        var currentOperand = calculator.currentOperand
        if calculator.isNegativeOperand {
           currentOperand = String(currentOperand.dropFirst())
        } else {
            currentOperand = "−" + currentOperand
        }
        
        calculator.updateCurrentOperand(currentOperand)
        updateNumberLabel(to: calculator.currentOperand)
    }
    
    private func clearEntry() {
        calculator.updateCurrentOperand("0")
        updateNumberLabel(to: calculator.currentOperand)
    }
    
    private func inputDot() {
        if calculator.isDecimal {
            return
        }
        
        let currentOperand = calculator.currentOperand + MathSymbol.dot
        
        calculator.updateCurrentOperand(currentOperand)
        updateNumberLabel(to: calculator.currentOperand)
    }
}

