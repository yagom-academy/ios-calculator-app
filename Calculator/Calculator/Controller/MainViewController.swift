//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    enum Sign {
        static let zero = "0"
        static let zeroTwice = "00"
        static let dot = "."
        static let empty = ""
        static let minus = "-"
        static let space = " "
        static let nan = "NaN"
    }
    
    var numberFormatter = NumberFormatter(numberStyle: .decimal,
                                          roundingMode: .halfUp,
                                          usesSignificantDigits: true,
                                          maximumSignificantDigits: 20)
    var currentInput = Sign.empty
    var currentOperand: String {
        return operandLabel.text ?? Sign.zero
    }
    var currentOperator: String {
        return operatorLabel.text ?? Sign.empty
    }
    
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var calculateItemStackView: CalculateItemStackView!
    @IBOutlet weak var calculateItemScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCurrentCalculateItem()
        calculateItemStackView.removeAllSubviews()
    }
    
    private func initializeCurrentCalculateItem() {
        operandLabel.text = Sign.zero
        operatorLabel.text = Sign.empty
    }
    
    @IBAction func touchOperandButton(_ sender: UIButton) {
        guard let inputOperand = sender.currentTitle else { return }
        
        if currentOperand != Sign.zero {
            let nextOperand = currentOperand + inputOperand
            operandLabel.text = numberFormatter.convertToDecimal(from: nextOperand)
        } else {
            operandLabel.text = inputOperand
        }
    }
    
    @IBAction func touchDotButton(_ sender: UIButton) {
        if currentOperand.contains(Sign.dot) {
            return
        } else {
            operandLabel.text = currentOperand + Sign.dot
        }
    }
    
    @IBAction func touchZeroButton(_ sender: UIButton) {
        guard let senderTitle = sender.currentTitle else { return }
        
        if currentOperand != Sign.zero,
           currentOperand.contains(Sign.dot) {
            operandLabel.text = currentOperand + senderTitle
        } else {
            operandLabel.text = numberFormatter.convertToDecimal(from: currentOperand + senderTitle)
        }
    }
    
    @IBAction func allClear(_ sender: UIButton) {
        calculateItemStackView.removeAllSubviews()
        initializeCurrentCalculateItem()
        currentInput = Sign.empty
    }
    
    @IBAction func clearOperandLabel(_ sender: UIButton) {
        operandLabel.text = Sign.zero
    }
    
    @IBAction func toggleSign(_ sender: UIButton) {
        guard currentOperand != Sign.zero,
              let convertedOperand = numberFormatter.convertToDouble(from: currentOperand),
              let toggledOperand = numberFormatter.convertToString(from: -convertedOperand) else { return }
        
        operandLabel.text = toggledOperand
    }
    
    @IBAction func touchOperatorButton(_ sender: UIButton) {
        guard let inputOperator = sender.currentTitle else { return }
            
        if operandLabel.text == Sign.zero {
            operatorLabel.text = inputOperator
        } else {
            calculateItemStackView.addCurrentItem()
            initializeCurrentCalculateItem()
            operatorLabel.text = sender.currentTitle
        }
    }
    
    @IBAction func calculateCurrentFormula(_ sender: UIButton) {
        guard currentOperator != Sign.empty else { return }
        
        addCurrentItem(to: calculateItemStackView)
        
        var formula = ExpressionParser.parse(from: currentInput)
        let result = formula.result()
        
        currentInput = Sign.empty
        operatorLabel.text = Sign.empty
        
        if result.isNaN == true {
            operandLabel.text = Sign.nan
        } else {
            operandLabel.text = numberFormatter.convertToString(from: result)
        }
    }
}

