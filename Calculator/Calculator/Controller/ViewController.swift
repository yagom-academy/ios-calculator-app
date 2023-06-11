//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
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
        
        operandLabel.text = String(operand.suffix(operand.count - 1))
    }
    
    @IBAction func touchUpResultButton(_ sender: UIButton) {
        guard !isResult else {
            return
        }
        
        if let operand = operandLabel.text, operand.hasSuffix(".") {
            operandLabel.text?.removeLast()
        }
        
        addStackView()
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
        guard let currentOperand = sender.currentTitle, !isResult else {
            return
        }
        guard currentOperand != "0" else {
            isInputZero = true
            return
        }
        guard let operand = operandLabel.text, !(operand.hasSuffix(".") && currentOperand == ".") else {
            return
        }
        guard operand != "0" || currentOperand == "." else {
            operandLabel.text = currentOperand
            return
        }

        operandLabel.text = operand + currentOperand
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        guard let operand = operandLabel.text, operand != "0" || isInputZero else {
            operatorLabel.text = sender.currentTitle
            return
        }
        
        if operand.hasSuffix(".") {
            operandLabel.text?.removeLast()
        }

        addStackView()
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
    
    private func addStackView() {
        let subStackView: StackView = StackView()
        let content: UIStackView = subStackView.configure(operator: operatorLabel, operand: operandLabel)
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
}

