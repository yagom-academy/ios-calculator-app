//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var operandLabel: UILabel!
    @IBOutlet private weak var historyStackView: UIStackView!
    @IBOutlet private weak var scrollView: UIScrollView!
    private var calculateInput: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetOperatorLabel()
        resetOperandLabel()
        removeAllsubviewsInHistoryStackView()
    }
    
    func resetOperatorLabel() {
        operatorLabel.text = ""
    }
    
    func resetOperandLabel() {
        operandLabel.text = "0"
    }

    func removeAllsubviewsInHistoryStackView() {
        historyStackView.subviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    func addOperandToOperandLabel(_ operand: String) {
        let currentLabelText: String = operandLabel.text ?? ""
        let isPointDuplication: Bool = operand == "." && currentLabelText.contains(".")
        let isZeroDuplication: Bool = currentLabelText == "0" && ["0", "00"].contains(operand)
        if isZeroDuplication || isPointDuplication {
            return
        }
        let isInitialState: Bool = currentLabelText == "0" && operand != "."
        if isInitialState {
            changeOperandLabelText(to: operand)
        } else {
            if operand == "." {
                changeOperandLabelText(to: "\(currentLabelText)\(operand)")
            } else {
                changeOperandLabelText(to: formatNumber(Double("\(removeComma(in: currentLabelText))\(operand)") ?? 0))
            }
        }
    }
    
    func changeOperandLabelText(to operand: String) {
        operandLabel.text = operand
    }
    
    func switchPositiveNegativeOfOperandLabelText() {
        var labelText: String = operandLabel.text ?? ""
        if labelText == "0" {
            return
        }
        let isNegative: Bool = labelText.hasPrefix("-")
        if isNegative {
            labelText.removeFirst()
            operandLabel.text = labelText
        } else {
            operandLabel.text = "-\(labelText)"
        }
    }
    
    func changeOperatorLabelText(to newOperator: String) {
        operatorLabel.text = newOperator
    }
    
    
    func addSubViewInHistoryStackView(newOperator: String, newOperand: String) {
        let stackView: UIStackView = UIStackView()
        stackView.spacing = 8
        let operatorLabel: UILabel = createLabel(labelText: newOperator)
        let operandLabel: UILabel = createLabel(labelText: newOperand)
        stackView.addArrangedSubview(operatorLabel)
        stackView.addArrangedSubview(operandLabel)
        historyStackView.addArrangedSubview(stackView)
    }
    
    func createLabel(labelText: String) -> UILabel {
        let label: UILabel = UILabel()
        label.text = labelText
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = .white
        return label
    }
    
    func formatNumber(_ number: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: number)) ?? ""
    }
    
    func removeComma(in text: String) -> String {
        return text.replacingOccurrences(of: ",", with: "")
    }
    
    func scrollToBottom() {
        let bottomOffset = CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.size.height + scrollView.contentInset.bottom)
        if(bottomOffset.y > 0) {
            scrollView.setContentOffset(bottomOffset, animated: true)
        }
    }
    
    @IBAction func touchUpClearEntryButton(_ sender: UIButton) {
        resetOperandLabel()
    }
    
    @IBAction func touchUpAllClearButton(_ sender: UIButton) {
        resetOperatorLabel()
        resetOperandLabel()
        removeAllsubviewsInHistoryStackView()
        calculateInput = ""
    }
    
    @IBAction func touchUpNumberPadButton(_ sender: UIButton) {
        if let labelText = sender.titleLabel?.text {
            addOperandToOperandLabel(labelText)
        }
    }
    
    @IBAction func touchUpPositiveNegativeButton(_ sender: UIButton) {
        switchPositiveNegativeOfOperandLabelText()
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        guard let newOperator = sender.titleLabel?.text else {
            return
        }
        let currentOperatorLabelText: String = operatorLabel.text ?? ""
        let currentOperandLabelText: String = operandLabel.text ?? ""
        changeOperatorLabelText(to: newOperator)
        let isEditing: Bool = currentOperandLabelText != "0"
        let isInitialState: Bool = calculateInput == ""
        let newOperatorLabelText: String
        if isInitialState {
            newOperatorLabelText = ""
        } else {
            newOperatorLabelText = currentOperatorLabelText
        }
        if isEditing {
            addSubViewInHistoryStackView(newOperator: newOperatorLabelText, newOperand: currentOperandLabelText)
            calculateInput += "\(newOperatorLabelText)\(currentOperandLabelText)"
            resetOperandLabel()
            scrollToBottom()
        }
    }
    
    @IBAction func touchUpEqualButton(_ sender: Any) {
        guard calculateInput != "" else {
            return
        }
        let currentOperatorLabelText: String = operatorLabel.text ?? ""
        let currentOperandLabelText: String = operandLabel.text ?? ""
        addSubViewInHistoryStackView(newOperator: currentOperatorLabelText, newOperand: currentOperandLabelText)
        calculateInput += "\(currentOperatorLabelText)\(currentOperandLabelText)"
        let calculateInputRemovedComma: String = removeComma(in: calculateInput)
        var formula: Formula = ExpressionParser.parse(from: calculateInputRemovedComma)
        if let result: Double = formula.result() {
            changeOperandLabelText(to: formatNumber(result))
            changeOperatorLabelText(to: "")
            calculateInput = ""
        }
        scrollToBottom()
    }
}

