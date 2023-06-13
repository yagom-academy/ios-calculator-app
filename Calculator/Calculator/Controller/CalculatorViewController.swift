//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var previousContentStackView: UIStackView!
    @IBOutlet weak var previousExpressionScrollView: UIScrollView!
    private var expression: String = ""
    private var isResult: Bool = false
    private let numberFormatter: NumberFormatter = {
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.usesSignificantDigits = true
        numberFormatter.maximumSignificantDigits = 20
        numberFormatter.roundingMode = .halfUp
        
        return numberFormatter
    }()
    private var currentOperand: String {
        guard let operand = operandLabel.text else {
            return "NaN"
        }
        
        return operand.replacingOccurrences(of: ",", with: "")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearLabel()
    }
    
    @IBAction func touchUpAllClearButton(_ sender: UIButton) {
        previousContentStackView.subviews.forEach { $0.removeFromSuperview() }
        clearLabel()
        expression = ""
        isResult = false
    }
    
    @IBAction func touchUpCleanEntryButton(_ sender: UIButton) {
        operandLabel.text = "0"
        isResult = false
    }
    
    @IBAction func touchUpSignButton(_ sender: UIButton) {
        toggleSign()
    }
    
    @IBAction func touchUpResultButton(_ sender: UIButton) {
        guard !isResult else {
            return
        }
        
        if let operand = operandLabel.text, operand.hasSuffix(".") {
            operandLabel.text?.removeLast()
        }
        
        addPreviousContentStackView()
        expression += configureCurrentFormula()
        var formula: Formula = ExpressionParser.parse(from: expression)
        
        do {
            let result: Double = try formula.result()
            updateNumberLabel(result)
        } catch CalculatorError.missingOperand {
            print(CalculatorError.missingOperand.localized)
        } catch {
            print(error)
        }
        
        operatorLabel.text = ""
        expression = ""
        isResult = true
    }
    
    @IBAction func touchUpOperandButton(_ sender: UIButton) {
        guard let operandElement = sender.currentTitle, !isResult else {
            return
        }
        guard currentOperand != "0" || currentOperand != "00" else {
            operandLabel.text = operandElement
            return
        }
        
        operandLabel.text = numberFormatter.string(for: Double(currentOperand + operandElement))
    }
    
    @IBAction func touchUpDecimalPointButton(_ sender: UIButton) {
        guard let decimalPointOperand = sender.currentTitle, !isResult else {
            return
        }
        guard !currentOperand.hasSuffix(decimalPointOperand) else {
            return
        }
        guard !currentOperand.contains(decimalPointOperand) else {
            return
        }
        
        operandLabel.text = currentOperand + decimalPointOperand
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        guard currentOperand != "0" else {
            operatorLabel.text = sender.currentTitle
            expression = "0"
            return
        }
        
        if currentOperand.hasSuffix(".") {
            operandLabel.text?.removeLast()
        }
        if let realNumber = Double(currentOperand), Double(currentOperand) == Double(Int(realNumber)) {
            operandLabel.text = String(Int(realNumber))
        }
        
        addPreviousContentStackView()
        expression += configureCurrentFormula()
        operatorLabel.text = sender.currentTitle
        operandLabel.text = "0"
        isResult = false
        scrollDown()
    }
    
    private func configureCurrentFormula() -> String {
        let operatorCase = operatorLabel.text ?? ""
        
        return operatorCase + currentOperand
    }
    
    private func addPreviousContentStackView() {
        let content: UIStackView = configureContentStackView()
        previousContentStackView.addArrangedSubview(content)
    }
    
    private func scrollDown() {
        previousExpressionScrollView.layoutIfNeeded()
        let bottomOffset = CGPoint(x: 0, y: previousExpressionScrollView.contentSize.height - previousExpressionScrollView.bounds.size.height)
        previousExpressionScrollView.setContentOffset(bottomOffset, animated: true)
    }
    
    private func clearLabel() {
        operandLabel.text = "0"
        operatorLabel.text = ""
    }
    
    private func configureContentStackView() -> UIStackView {
        let recordedOperatorLabel: UILabel = configureItem(with: operatorLabel.text)
        let recordedOperandLabel: UILabel = configureItem(with: currentOperand)
        let content: UIStackView = addItemToContentStackView(item: recordedOperatorLabel, recordedOperandLabel)
        
        return content
    }
    
    private func addItemToContentStackView(item formula: UILabel...) -> UIStackView {
        let content: UIStackView = UIStackView()
        content.translatesAutoresizingMaskIntoConstraints = false
        content.axis = .horizontal
        content.alignment = .fill
        content.distribution = .equalSpacing
        content.spacing = 8
        formula.forEach { content.addArrangedSubview($0) }
        
        return content
    }
    
    private func configureItem(with labelText: String?) -> UILabel {
        let recordedLabel: UILabel = UILabel()
        recordedLabel.font = .preferredFont(forTextStyle: .title3)
        recordedLabel.text = labelText
        recordedLabel.textColor = .white
        
        return recordedLabel
    }
}

extension CalculatorViewController {
    private func updateNumberLabel(_ number: Double) {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 20
        numberFormatter.numberStyle = .decimal
        numberFormatter.roundingMode = .halfUp
        
        if let formattedNumber = numberFormatter.string(from: NSNumber(value: number)) {
            operandLabel.text = formattedNumber
        }
    }
    
    private func toggleSign() {
        guard let currentNumberString = operandLabel.text,
              var currentNumber = Double(currentNumberString),
              Double(currentOperand) != Double.zero else {
            return
        }
        
        currentNumber *= -1
        
        if Double(currentNumber) == Double(Int(currentNumber)) {
            operandLabel.text = String(Int(currentNumber))
        } else {
            operandLabel.text = String(currentNumber)
        }
    }
}
