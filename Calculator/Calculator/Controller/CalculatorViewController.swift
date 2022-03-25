//
//  CalculatorViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    
    private var temporaryOperandText: String = ""
    private let singleZero = "0"
    private let doubleZero = "00"
    private let singleDot = "."
    private let singleZeroAndDot = "0."
    private let emptyStateString = ""
    
    @IBOutlet weak var operatorsLabel: UILabel!
    @IBOutlet weak var operandsLabel: UILabel!
    @IBOutlet weak var verticalStackView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        operandsLabel.text = singleZero
        operatorsLabel.text = emptyStateString
    }
    
    @IBAction func tappedOperandButtons(_ sender: UIButton) {
        guard let operandButtonsTitleText = sender.titleLabel?.text else {
            return
        }
        
        let currentOperandsLabel = operandsLabel.text
        
        resetOperandsLabelState()
        
        guard isValidZeroForOperandsLabel(inputText: operandButtonsTitleText, currentLabel: currentOperandsLabel) else {
            return
        }
        guard isValidDotForOperandsLabel(inputText: operandButtonsTitleText,
                               currentLabel: currentOperandsLabel) else {
            return
        }
        
        appendOperandAtTemporaryOperandText(by: operandButtonsTitleText)
        inputAtOperandsLabel(by: operandButtonsTitleText)
    }
    
    private func resetOperandsLabelState() {
        if temporaryOperandText == emptyStateString {
            operandsLabel.text = singleZero
        }
    }
    
    private func isValidZeroForOperandsLabel(inputText: String, currentLabel: String?) -> Bool {
        if currentLabel == singleZero && inputText == singleZero {
            return false
        }
        if currentLabel == singleZero && inputText == doubleZero {
            return false
        }
        return true
    }
    
    private func isValidDotForOperandsLabel(inputText: String, currentLabel: String?) -> Bool {
        if currentLabel?.contains(singleDot) == true && inputText == singleDot {
            return false
        }
        if currentLabel == singleZero && inputText == singleDot {
            appendOperandAtTemporaryOperandText(by: singleZeroAndDot)
            inputAtOperandsLabel(by: singleZeroAndDot)
            return false
        }
        return true
    }
    
    private func appendOperandAtTemporaryOperandText(by inputOperand: String) {
        temporaryOperandText += "\(inputOperand)"
        print(temporaryOperandText)
    }
    
    private func inputAtOperandsLabel(by inputOperand: String) {
        guard var temporaryLabel = operandsLabel.text else { return }
        
        if temporaryLabel == singleZero {
            temporaryLabel = emptyStateString
        }
        temporaryLabel += "\(inputOperand)"
        operandsLabel.text = temporaryLabel
    }
    
    @IBAction func tappedOperatorButtons(_ sender: UIButton) {
        guard let operatorButtonsTitleText = sender.titleLabel?.text else {
            return
        }
        
        let currentOperandsLabel = operandsLabel.text
        let currentOperatorsLabel = operatorsLabel.text
        
        guard isValidZeroForOperatorsLabel(currentOperandsLabel: currentOperandsLabel) else {
            return
        }
        guard isValidOperatorsHasNotSuffix() else {
            return
        }
        
        addArrangedStackView(operatorText: currentOperatorsLabel, operandText: currentOperandsLabel)
        inputAtOperatorsLabel(by: operatorButtonsTitleText)
        appendOperatorAtTemporaryOperandText(by: operatorButtonsTitleText)
        operandsLabel.text = singleZero
    }
    
    private func isValidZeroForOperatorsLabel(currentOperandsLabel: String?) -> Bool {
        if currentOperandsLabel == singleZero {
            return false
        }
        return true
    }
    
    private func isValidOperatorsHasNotSuffix() -> Bool {
        if temporaryOperandText.hasSuffix("+ ") ||
           temporaryOperandText.hasSuffix("− ") ||
           temporaryOperandText.hasSuffix("× ") ||
           temporaryOperandText.hasSuffix("÷ ") {
            return false
        }
        return true
    }
    
    private func inputAtOperatorsLabel(by inputOperator: String) {
        operatorsLabel.text = inputOperator
    }
    
    private func appendOperatorAtTemporaryOperandText(by inputOperator: String) {
        temporaryOperandText += " \(inputOperator) "
        print(temporaryOperandText)
    }
    
    private func addArrangedStackView(operatorText: String?, operandText: String?) {
        guard let operatorText = operatorText, let operandText = operandText else {
            return
        }
        
        let scrollViewOperatorsLabel: UILabel = {
            let label = UILabel()
            label.textColor = UIColor.white
            label.font = UIFont.preferredFont(forTextStyle: .title3)
            label.textAlignment = .right
            label.text = "\(operatorText)"
            return label
        }()
        
        let scrollViewOperandsLabel: UILabel = {
            let label = UILabel()
            label.textColor = UIColor.white
            label.font = UIFont.preferredFont(forTextStyle: .title3)
            label.textAlignment = .right
            label.text = "\(operandText)"
            return label
        }()
        
        let stackView: UIStackView = {
            let view = UIStackView(arrangedSubviews: [scrollViewOperatorsLabel, scrollViewOperandsLabel])
            view.axis = .horizontal
            view.alignment = .fill
            view.spacing = 8
            view.distribution = .fill
            view.contentMode = .scaleToFill
            return view
        }()
        
        verticalStackView.addArrangedSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor).isActive = true
    }
    
    @IBAction func tappedAllClearButton(_ sender: UIButton) {
        temporaryOperandText = emptyStateString
        operatorsLabel.text = emptyStateString
        operandsLabel.text = singleZero
    }
    
    @IBAction func tappedClearElementButton(_ sender: UIButton) {
    }
    
    @IBAction func tappedPositiveNegativeConversionButton(_ sender: UIButton) {
    }
    
    @IBAction func tappedEqualSignButton(_ sender: UIButton) {
        guard let equalSign = sender.titleLabel?.text else {
            return
        }
        
        if equalSign == "=" {
           try? executionExpressionParser()
        }
    }
    
    private func executionExpressionParser() throws {
        guard isValidOperatorsHasNotSuffix() else {
            return
        }
        
        if temporaryOperandText == emptyStateString {
            return
        }
        
        let currentOperandsLabel = operandsLabel.text
        let currentOperatorsLabel = operatorsLabel.text
        
        addArrangedStackView(operatorText: currentOperatorsLabel, operandText: currentOperandsLabel)
    
        let result: Double
        do {
            result = try ExpressionParser.parse(from: temporaryOperandText).result()
            operandsLabel.text = "\(result)"
            operatorsLabel.text = emptyStateString
            temporaryOperandText = emptyStateString
        } catch CalculatorError.divideByZero {
            operandsLabel.text = CalculatorError.divideByZero.description
        }
    }
}
