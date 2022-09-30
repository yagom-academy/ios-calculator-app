//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    private var calculateInput: String = ""
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var operandLabel: UILabel!
    @IBOutlet private weak var historyStackView: UIStackView!
    @IBOutlet private weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetOperatorLabel()
        resetOperandLabel()
        removeAllsubviewsInHistoryStackView()
    }
    
    private func resetOperatorLabel() {
        operatorLabel.text = ""
    }
    
    private func resetOperandLabel() {
        operandLabel.text = "0"
    }
    
    private func removeAllsubviewsInHistoryStackView() {
        historyStackView.subviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    private func addOperandToOperandLabel(_ operand: String) {
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
                changeOperandLabelText(to: formatNumber("\(removeComma(in: currentLabelText))\(operand)"))
            }
        }
    }
    
    private func changeOperandLabelText(to operand: String) {
        operandLabel.text = operand
    }
    
    private func switchPositiveNegativeOfOperandLabelText() {
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
    
    private func changeOperatorLabelText(to newOperator: String) {
        operatorLabel.text = newOperator
    }
    
    
    private func addSubViewInHistoryStackView(newOperator: String, newOperand: String) {
        let stackView: UIStackView = UIStackView()
        stackView.spacing = 8
        let operatorLabel: UILabel = createLabel(labelText: newOperator)
        let operandLabel: UILabel = createLabel(labelText: newOperand)
        stackView.addArrangedSubview(operatorLabel)
        stackView.addArrangedSubview(operandLabel)
        historyStackView.addArrangedSubview(stackView)
    }
    
    private func createLabel(labelText: String) -> UILabel {
        let label: UILabel = UILabel()
        label.text = labelText
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = .white
        return label
    }
    
    private func formatNumber(_ number: String) -> String {
        let intNumber: Int = Int(floor(Double(number) ?? 0))
        let decimalRange = number.index(number.startIndex, offsetBy: String(intNumber).count)..<number.endIndex
        let decimalNumber: String = String(number[decimalRange])
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        var result: String = "\(numberFormatter.string(from: NSNumber(value: intNumber)) ?? "")\(decimalNumber)"
        while result.count > 20 {
            result.popLast()
        }
        return result
    }
    
    private func removeComma(in text: String) -> String {
        return text.replacingOccurrences(of: ",", with: "")
    }
    
    func removeLastCommaZero(in text: String) -> String {
        var result: String = text
        if text.hasSuffix(".0") {
            result.popLast()
            result.popLast()
            return result
        }
        return result
    }
    
    private func scrollToBottom() {
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
        let isNanError: Bool = currentOperandLabelText == CalculateError.dividedByZero.localizedDescription
        let newOperandLabelText: String
        if isNanError {
            newOperandLabelText = "0"
        } else {
            newOperandLabelText = currentOperandLabelText
        }
        if isEditing {
            addSubViewInHistoryStackView(newOperator: newOperatorLabelText, newOperand: currentOperandLabelText)
            calculateInput += "\(newOperatorLabelText)\(newOperandLabelText)"
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
        let result = formula.result()
        switch result {
        case .failure(let calculateError):
            changeOperandLabelText(to: calculateError.localizedDescription)
            changeOperatorLabelText(to: "")
            calculateInput = ""
        case .success(let result):
            if let result {
                let resultToDisplay: String = removeLastCommaZero(in: formatNumber(String(result)))
                changeOperandLabelText(to: resultToDisplay)
                changeOperatorLabelText(to: "")
                calculateInput = ""
            }
        }
        scrollToBottom()
    }
}

