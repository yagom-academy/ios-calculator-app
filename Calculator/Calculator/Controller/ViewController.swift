//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    private var expression: String = ""
    private var isResult: Bool = false
    private var isInputZero: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearLabel()
    }

    @IBAction func touchUpAllClearButton(_ sender: UIButton) {
        stackView.subviews.forEach { $0.removeFromSuperview() }
        clearLabel()
        expression = ""
        configureCondition(isResult: false, isInputZero: true)
    }
    
    @IBAction func touchUpCleanEntryButton(_ sender: UIButton) {
        guard !isResult else {
            return
        }
        
        operandLabel.text = "0"
        configureCondition(isResult: false, isInputZero: false)
    }
    
    @IBAction func touchUpSignButton(_ sender: UIButton) {
        guard let operand = operandLabel.text, operand != "0", operand != "0." else {
            return
        }
        guard operand.hasPrefix("-") else {
            operandLabel.text = "-\(operand)"
            return
        }
        
        operandLabel.text = String(operand.suffix(operand.count - 1))
    }
    
    @IBAction func touchUpResultButton(_ sender: UIButton) {
        guard !isResult else {
            return
        }
        
        addStackView()
        var formula: Formula = ExpressionParser.parse(from: expression)
        let result: Double = formula.result()
        operandLabel.text = result.formatNumbers()
        operatorLabel.text = ""
        expression = ""
        configureCondition(isResult: true, isInputZero: true)
    }
    
    @IBAction func touchUpOperandButton(_ sender: UIButton) {
        guard let currentOperand = sender.currentTitle, !isResult else {
            return
        }
        guard currentOperand != "0" else {
            configureCondition(isResult: false, isInputZero: true)
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
            operandLabel.text = String(operand.prefix(operand.count - 1))
        }

        addStackView()
        configureCondition(isResult: false, isInputZero: false)
        operandLabel.text = "0"
        operatorLabel.text = sender.currentTitle
    }
    
    private func configureCurrentFormula() -> String {
        guard let operand = operandLabel.text else {
            return ""
        }
        
        return "\(operatorLabel.text ?? "")\(operand)"
    }
    
    private func addStackView() {
        let subStackView: StackView = StackView()
        let content: UIStackView = subStackView.configure(operator: operatorLabel, operand: operandLabel)
        stackView.addArrangedSubview(content)
        scrollDown()
        expression += configureCurrentFormula()
    }
    
    private func scrollDown() {
        scrollView.layoutIfNeeded()
        let bottomOffset = CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.size.height)
        scrollView.setContentOffset(bottomOffset, animated: true)
    }
    
    private func clearLabel() {
        operandLabel.text = "0"
        operatorLabel.text = ""
    }
    
    private func configureCondition(isResult: Bool, isInputZero: Bool) {
        self.isResult = isResult
        self.isInputZero = isInputZero
    }
}

