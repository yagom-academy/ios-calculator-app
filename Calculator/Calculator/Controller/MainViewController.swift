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
        static let comma = ","
    }
    
    var numberFormatter = NumberFormatter()
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
        initializeNumberFormatter()
    }
    
    private func initializeCurrentCalculateItem() {
        operandLabel.text = Sign.zero
        operatorLabel.text = Sign.empty
    }
    
    private func initializeNumberFormatter() {
        numberFormatter.numberStyle = .decimal
        numberFormatter.roundingMode = .halfUp
        numberFormatter.usesSignificantDigits = true
        numberFormatter.maximumSignificantDigits = 20
    }
    
    @IBAction func touchOperandButton(_ sender: UIButton) {
        guard let inputOperand = sender.currentTitle else { return }
        
        if currentOperand != Sign.zero {
            let nextOperand = currentOperand + inputOperand
            operandLabel.text = convertToDecimal(from: nextOperand)
        } else {
            operandLabel.text = inputOperand
        }
    }
    
    private func convertToDecimal(from string: String) -> String? {
        guard let double = convertToDouble(from: string) else { return nil }
        let decimalStyleString = convertToString(from: double)
        
        return decimalStyleString
    }
    
    private func convertToDouble(from labelText: String) -> Double? {
        let comma = Character(Sign.comma)
        let splitedText = labelText.split(with: comma).joined()
        
        return Double(splitedText)
    }
    
    private func convertToString(from double: Double) -> String? {
        let convertedDouble = NSNumber(value: double)
        let result = numberFormatter.string(from: convertedDouble)
        
        return result
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
            operandLabel.text = convertToDecimal(from: currentOperand + senderTitle)
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
              let convertedOperand = convertToDouble(from: currentOperand),
              let toggledOperand = convertToString(from: -convertedOperand) else { return }
        
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
            operandLabel.text = convertToString(from: result)
        }
    }
}

