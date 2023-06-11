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
    private var isInputZero: Bool = true
    private let numberFormatter: NumberFormatter = {
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.usesSignificantDigits = true
        numberFormatter.maximumSignificantDigits = 20
        
        return numberFormatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearLabel()
    }

    @IBAction func touchUpAllClearButton(_ sender: UIButton) {
        previousContentStackView.subviews.forEach { $0.removeFromSuperview() }
        clearLabel()
        expression = ""
        isResult = false
        isInputZero = true
    }
    
    @IBAction func touchUpCleanEntryButton(_ sender: UIButton) {
        operandLabel.text = "0"
        isResult = false
        isInputZero = false
    }
    
    @IBAction func touchUpSignButton(_ sender: UIButton) {
        guard let operand = operandLabel.text, Double(operand) != Double.zero else {
            return
        }
        guard operand.hasPrefix("−") else {
            operandLabel.text = "−\(operand)"
            return
        }
        
        operandLabel.text?.removeFirst()
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
        let result: Double = formula.result()
        operandLabel.text = numberFormatter.string(for: result)?.replacingOccurrences(of: "-", with: "−")
        operatorLabel.text = ""
        expression = ""
        isResult = true
        isInputZero = true
    }
    
    @IBAction func touchUpOperandButton(_ sender: UIButton) {
        guard let currentOperand = sender.currentTitle, let operand = operandLabel.text, !isResult else {
            return
        }
        guard currentOperand != "0" else {
            isInputZero = true
            return
        }
        guard operand != "0" else {
            operandLabel.text = currentOperand
            return
        }

        operandLabel.text = operand + currentOperand
    }
    
    @IBAction func touchUpDecimalPointButton(_ sender: UIButton) {
        guard let decimalPointOperand = sender.currentTitle, !isResult else {
            return
        }
        guard let operand = operandLabel.text, !operand.hasSuffix(decimalPointOperand) else {
            return
        }
        guard !operand.contains(decimalPointOperand) else {
            return
        }
        
        operandLabel.text = operand + decimalPointOperand
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        guard let operand = operandLabel.text?.replacingOccurrences(of: "−", with: "-"),
              operand != "0" || isInputZero
        else {
            operatorLabel.text = sender.currentTitle
            return
        }
        
        if operand.hasSuffix(".") {
            operandLabel.text?.removeLast()
        }
        if let realNumber = Double(operand), Double(operand) == Double(Int(realNumber)) {
            operandLabel.text = String(Int(realNumber))
        }

        addPreviousContentStackView()
        expression += configureCurrentFormula()
        operatorLabel.text = sender.currentTitle
        operandLabel.text = "0"
        isResult = false
        isInputZero = false
        scrollDown()
    }
    
    private func configureCurrentFormula() -> String {
        let operatorCase = operatorLabel.text ?? ""
        let operand = operandLabel.text ?? ""
        
        return operatorCase + operand
    }
    
    private func addPreviousContentStackView() {
        let content: UIStackView = configureContentStackView(operator: operatorLabel, operand: operandLabel)
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
    
    private func configureContentStackView(operator currentOperator: UILabel, operand currentOperand: UILabel) -> UIStackView {
        let recordedOperatorLabel: UILabel = configureItem(with: currentOperator)
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

    private func configureItem(with label: UILabel) -> UILabel {
        let recordedLabel: UILabel = UILabel()
        recordedLabel.font = .preferredFont(forTextStyle: .title3)
        recordedLabel.text = label.text
        recordedLabel.textColor = .white
        
        return recordedLabel
    }
}

