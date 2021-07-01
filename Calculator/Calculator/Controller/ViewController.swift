//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var operandInputLabel: UILabel!
    @IBOutlet weak var operatorInputLabel: UILabel!
    @IBOutlet weak var equalSignButton: UIButton!
    private var currentNumber: String = .zero {
        didSet {
            operandInputLabel.text = currentNumber
        }
    }
    private var currentOperator: String = .empty {
        didSet {
            operatorInputLabel.text = currentOperator
        }
    }
    let calculator = Calculator()
    var observerContainer: NSKeyValueObservation?
    let operatorButtonColor = #colorLiteral(red: 0.8941176471, green: 0.5725490196, blue: 0.231372549, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetOperandInputLabel()
        resetOperatorInputLabel()
        addObserver()
    }
    
    deinit {
        removeObserver()
    }
}

extension ViewController {
    private func addObserver() {
        observerContainer = calculator.observe(\.infixExpression,
                                               options: [.new, .initial]) { [weak self] _, change in
            guard let infixExpresionLength = change.newValue?.count else {
                return
            }
            let needToEnable = infixExpresionLength > 0
            self?.equalSignButton.isEnabled = needToEnable
            self?.equalSignButton.backgroundColor = needToEnable ? self?.operatorButtonColor : .gray
        }
    }
    
    private func removeObserver() {
        observerContainer = nil
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
        guard let operatorSymbol = sender.currentTitle else {
            return
        }
        if !isCurrentNumberZero() {
            calculator.putIntoInfixExpression(of: currentOperator)
            calculator.putIntoInfixExpression(of: currentNumber)
            resetOperandInputLabel()
        }
        currentOperator = operatorSymbol
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
        currentOperator = .empty
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
