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
        isResult = false
        isInputZero = true
    }
    
    @IBAction func touchUpCleanEntryButton(_ sender: UIButton) {
        guard !isResult else {
            return
        }
        
        operandLabel.text = "0"
        isInputZero = false
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
        expression += configureCurrentFormula()
        var formula: Formula = ExpressionParser.parse(from: expression)
        let result: Double = formula.result()
        operandLabel.text = result.formatNumbers()
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
            operandLabel.text = String(operand.prefix(operand.count - 1))
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
        guard let operand = operandLabel.text else {
            return ""
        }
        
        return "\(operatorLabel.text ?? "")\(operand)"
    }
    
    private func addStackView() {
        let recordedOperatorLabel: UILabel = configureItem(with: operatorLabel)
        let recordedOperandLabel: UILabel = configureItem(with: operandLabel)
        let content: UIStackView = configureContent(item: recordedOperatorLabel, recordedOperandLabel)
        stackView.addArrangedSubview(content)
    }
    
    private func configureContent(item formula: UILabel...) -> UIStackView {
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
    
    private func scrollDown() {
        scrollView.layoutIfNeeded()
        let bottomOffset = CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.size.height)
        scrollView.setContentOffset(bottomOffset, animated: true)
    }
    
    private func clearLabel() {
        operandLabel.text = "0"
        operatorLabel.text = ""
    }
}

