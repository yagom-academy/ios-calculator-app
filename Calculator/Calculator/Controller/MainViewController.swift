//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    enum Condition {
        static let zero = "0"
        static let zeroTwice = "00"
        static let dot = "."
        static let empty = ""
        static let minus = "-"
        static let space = " "
        static let nan = "NaN"
    }
    
    var numberFormatter = NumberFormatter()
    var currentInput = Condition.empty
    
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
        self.operandLabel.text = Condition.zero
        self.operatorLabel.text = Condition.empty
    }
    
    private func initializeScrollView() {
        calculateItemStackView
            .arrangedSubviews
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
        
        if let currentOperand = operandLabel.text,
           currentOperand != Condition.zero {
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
        let splitedText = labelText.split(with: ",").joined()
        
        return Double(splitedText)
    }
    
    private func convertToString(from double: Double) -> String? {
        let convertedDouble = NSNumber(value: double)
        let result = numberFormatter.string(from: convertedDouble)
        
        return result
    }
    
    @IBAction func touchDotButton(_ sender: UIButton) {
        guard let dot = sender.currentTitle else { return }
        
        if let currentOperand = operandLabel.text {
            operandLabel.text = currentOperand + dot
        }
        
    }
    
    @IBAction func touchZeroButton(_ sender: UIButton) {
        guard let zero = sender.currentTitle else { return }
        
        if let currentOperand = operandLabel.text,
           currentOperand != Condition.zero {
            operandLabel.text = currentOperand + zero
        }
    }
    
    @IBAction func allClear(_ sender: UIButton) {
        initializeScrollView()
        initializeCurrentCalculateItem()
        currentInput = Condition.empty
    }
    
    @IBAction func clearOperandLabel(_ sender: UIButton) {
        operandLabel.text = Condition.zero
    }
    
    @IBAction func toggleSign(_ sender: UIButton) {
        guard let operandText = operandLabel.text,
              operandText != Condition.zero,
              let currentOperand = convertToDouble(from: operandText),
              let toggledOperand = convertToString(from: -currentOperand) else { return }
        
        operandLabel.text = toggledOperand
    }
    
    @IBAction func touchOperatorButton(_ sender: UIButton) {
        guard let inputOperator = sender.currentTitle else { return }
            
        if operandLabel.text == Condition.zero {
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
    
    private func add(_ subview: UIStackView, to superview: UIStackView) {
        let calculateItem = subview
        superview.addArrangedSubview(calculateItem)
    }
    
    private func generateCurrentItemStackView() -> UIStackView? {
        let operand = UILabel()
        operand.text = operandLabel.text
        operand.textColor = UIColor.white
        operand.font = UIFont.preferredFont(forTextStyle: .title3)
        
        let `operator` = UILabel()
        `operator`.text = operatorLabel.text
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
    
    private func addToCurrentInput(about `operator`: UILabel, and operand: UILabel) {
        guard let input = makeInput(from: `operator`, and: operand) else { return }
        currentInput += input
    }
    
    private func makeInput(from `operator`: UILabel, and operand: UILabel) -> String? {
        guard let operatorText = `operator`.text,
              let operandText = operand.text else { return nil }
        
        let result = Condition.space + operatorText + Condition.space + operandText
        
        return result
    }
    
    @IBAction func calculateCurrentFormula(_ sender: UIButton) {
        guard operatorLabel.text != Condition.empty else { return }
        
        addCurrentItem(to: calculateItemStackView)
        
        var formula = ExpressionParser.parse(from: currentInput)
        let result = formula.result()
        
        currentInput = Condition.empty
        operatorLabel.text = Condition.empty
        
        if result.isNaN == true {
            operandLabel.text = Condition.nan
        } else {
            operandLabel.text = String(result)
        }
    }
}

