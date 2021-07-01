//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var operandInputLabel: UILabel!
    @IBOutlet weak var operatorInputLabel: UILabel!
    private var currentNumber: String = .zero {
        didSet {
            operandInputLabel.text = currentNumber
        }
    }
    let calculator = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetOperandInputLabel()
        resetOperatorInputLabel()
    }
}

extension ViewController {
    @IBAction func tapNumberButton(_ sender: UIButton) {
        guard let number = sender.currentTitle else {
            return
        }
        if isCurrentNumberZero() {
            currentNumber = number
        } else {
            currentNumber.append(number)
        }
    }
    
    @IBAction func tapHundredButton(_ sender: UIButton) {
        guard let doubleZero = sender.currentTitle else {
            return
        }
        if !isCurrentNumberZero() {
            currentNumber.append(doubleZero)
        }
    }
    
    @IBAction func tapDotButton(_ sender: UIButton) {
        if !isCurrentNumberFloatingPoint() {
            currentNumber.append(.dot)
        }
    }
    
    @IBAction func tapOperatorButton(_ sender: UIButton) {
        
    }
    
    @IBAction func tapCalculateButton(_ sender: UIButton) {
        
    }
    
    @IBAction func tapClearButton(_ sender: UIButton) {
        guard let buttonTitle = sender.currentTitle else {
            return
        }
        switch buttonTitle {
        case .allClear:
            resetOperandInputLabel()
            resetOperatorInputLabel()
            calculator.clearAll()
        case .clearEntry:
            resetOperandInputLabel()
        default:
            break
        }
    }
    
    @IBAction func tapChangeSignButton(_ sender: UIButton) {
        guard currentNumber != .zero else {
            return
        }
        if !isCurrentNumberNegative() {
            currentNumber = .negativeSign + currentNumber
        } else {
            currentNumber.removeFirst()
        }
    }
}

extension ViewController {
    private func resetOperandInputLabel() {
        currentNumber = .zero
    }
    
    private func resetOperatorInputLabel() {
        operatorInputLabel.text = .empty
    }
    
    private func isCurrentNumberZero() -> Bool {
        currentNumber == .zero
    }
    
    private func isCurrentNumberFloatingPoint() -> Bool {
        currentNumber.contains(String.dot)
    }
    
    private func isCurrentNumberNegative() -> Bool {
        currentNumber.hasPrefix(.negativeSign)
    }
}
