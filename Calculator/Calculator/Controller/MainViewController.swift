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
    @IBOutlet weak var calculateItemStackView: UIStackView!
    @IBOutlet weak var calculateItemScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCurrentCalculateItem()
        initializeScrollView()
        initializeNumberFormatter()
    }
    
    private func initializeCurrentCalculateItem() {
        operandLabel.text = Sign.zero
        operatorLabel.text = Sign.empty
    }
    
    private func initializeScrollView() {
        calculateItemStackView
            .subviews
            .forEach { $0.removeFromSuperview() }
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
        guard let convertedDouble = convertToDouble(from: string) else { return nil }
        let decimalStyle = convertToString(from: convertedDouble)
        
        return decimalStyle
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
        if currentOperand != Sign.zero,
           currentOperand.contains(Sign.dot) {
            operandLabel.text = currentOperand + Sign.zero
        } else {
            operandLabel.text = convertToDecimal(from: currentOperand + Sign.zero)
        }
    }
    
    @IBAction func allClear(_ sender: UIButton) {
        initializeScrollView()
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
            addCurrentItem(to: calculateItemStackView)
            operatorLabel.text = sender.currentTitle
        }
    }
    
    private func addCurrentItem(to stackView: UIStackView) {
        guard let subview = generateCurrentItemStackView() else { return }
        
        add(subview, to: stackView)
        calculateItemScrollView.layoutIfNeeded()
        calculateItemScrollView.setContentOffset(CGPoint(x: 0, y: calculateItemScrollView.contentSize.height - calculateItemScrollView.bounds.height), animated: true)
        initializeCurrentCalculateItem()
    }
    
    private func generateCurrentItemStackView() -> UIStackView? {
        let operand = UILabel()
        operand.text = convertToDecimal(from: currentOperand)
        operand.textColor = UIColor.white
        operand.font = UIFont.preferredFont(forTextStyle: .title3)
        
        let `operator` = UILabel()
        `operator`.text = currentOperator
        `operator`.textColor = UIColor.white
        `operator`.font = UIFont.preferredFont(forTextStyle: .title3)
        
        let result = UIStackView()
        result.addArrangedSubview(`operator`)
        result.addArrangedSubview(operand)
        result.axis = .horizontal
        result.spacing = 8
        result.alignment = .fill
        result.distribution = .fill
        
        addToCurrentInput(about: `operator`, and: operand)
        
        return result
    }
    
    private func add(_ subview: UIStackView, to superview: UIStackView) {
        let calculateItem = subview
        superview.addArrangedSubview(calculateItem)
    }
    
    private func addToCurrentInput(about `operator`: UILabel, and operand: UILabel) {
        guard let input = makeInput(from: `operator`, and: operand) else { return }
        currentInput += input
    }
    
    private func makeInput(from `operator`: UILabel, and operand: UILabel) -> String? {
        guard let operatorText = `operator`.text,
              let operandText = operand.text,
              let convertedOperandText = convertToNone(from: operandText) else { return nil }
        
        let result = operatorText + Sign.space + convertedOperandText + Sign.space
        
        return result
    }
    
    private func convertToNone(from decimal: String) -> String? {
        let comma = Character(Sign.comma)
        let noneStyle = decimal.split(with: comma).joined()
        
        return noneStyle
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

