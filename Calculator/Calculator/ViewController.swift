//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {
    
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
            let newLabelText: String
            if operand == "." {
                newLabelText = "\(currentLabelText)\(operand)"
            } else {
                newLabelText = formatNumber("\(currentLabelText)\(operand)")
            }
            changeOperandLabelText(to: newLabelText)
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
        let isNegativeNumber: Bool = labelText.hasPrefix("-")
        if isNegativeNumber {
            labelText.removeFirst()
            operandLabel.text = labelText
        } else {
            operandLabel.text = "-\(labelText)"
        }
    }
    
    private func changeOperatorLabelText(to newOperator: String) {
        operatorLabel.text = newOperator
    }
    
    private func addSubViewInHistoryStackView(operatorText: String, operandText: String) {
        let stackView: UIStackView = UIStackView()
        stackView.spacing = 8
        let operatorLabel: UILabel = createLabel(labelText: operatorText)
        let operandLabel: UILabel = createLabel(labelText: operandText)
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
        var formatNumber: String = "\(numberFormatter.string(from: NSNumber(value: intNumber)) ?? "")\(decimalNumber)"
        if formatNumber.count > 20 {
            formatNumber.removeLast(formatNumber.count - 20)
        }
        return formatNumber
    }
    
    private func removeLastCommaZero(_ input: String) -> String {
        var result: String = input
        if result.hasSuffix(".0") {
            result.removeLast(2)
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
    
    @IBAction private func touchUpClearEntryButton(_ sender: UIButton) {
        resetOperandLabel()
    }
    
    @IBAction private func touchUpAllClearButton(_ sender: UIButton) {
        resetOperatorLabel()
        resetOperandLabel()
        removeAllsubviewsInHistoryStackView()
        calculateInput = ""
    }
    
    @IBAction private func touchUpNumberPadButton(_ sender: UIButton) {
        if let operand: String = sender.titleLabel?.text {
            addOperandToOperandLabel(operand)
        }
    }
    
    @IBAction private func touchUpPositiveNegativeButton(_ sender: UIButton) {
        switchPositiveNegativeOfOperandLabelText()
    }
    
    @IBAction private func touchUpOperatorButton(_ sender: UIButton) {
        guard let inputOperator: String = sender.titleLabel?.text else {
            return
        }
        let currentOperatorLabelText: String = operatorLabel.text ?? ""
        let currentOperandLabelText: String = operandLabel.text ?? ""
        changeOperatorLabelText(to: inputOperator)
        let newOperatorLabelText: String
        let isEmptyCalculateInput: Bool = calculateInput == ""
        if isEmptyCalculateInput {
            newOperatorLabelText = ""
        } else {
            newOperatorLabelText = currentOperatorLabelText
        }
        let newOperandLabelText: String
        let isNanError: Bool = currentOperandLabelText == CalculateError.dividedByZero.localizedDescription
        if isNanError {
            newOperandLabelText = "0"
        } else {
            newOperandLabelText = currentOperandLabelText
        }
        let isEditing: Bool = currentOperandLabelText != "0"
        if isEditing {
            addSubViewInHistoryStackView(operatorText: newOperatorLabelText, operandText: currentOperandLabelText)
            calculateInput += "\(newOperatorLabelText)\(newOperandLabelText)"
            resetOperandLabel()
            scrollToBottom()
        }
    }
    
    @IBAction private func touchUpEqualButton(_ sender: Any) {
        let isEmptyCalculateInput: Bool = calculateInput == ""
        if isEmptyCalculateInput {
            return
        }
        let currentOperatorLabelText: String = operatorLabel.text ?? ""
        let currentOperandLabelText: String = operandLabel.text ?? ""
        addSubViewInHistoryStackView(operatorText: currentOperatorLabelText, operandText: currentOperandLabelText)
        calculateInput += "\(currentOperatorLabelText)\(currentOperandLabelText)"
        let calculateInputRemovedComma: String = calculateInput
        var formula: Formula = ExpressionParser.parse(from: calculateInputRemovedComma)
        let result = formula.result()
        switch result {
        case .failure(let error):
            changeOperandLabelText(to: error.localizedDescription)
            resetOperatorLabel()
            calculateInput = ""
        case .success(let result):
            if let result {
                let resultToDisplay: String = removeLastCommaZero(formatNumber(String(result)))
                changeOperandLabelText(to: resultToDisplay)
                resetOperatorLabel()
                calculateInput = ""
            }
        }
        scrollToBottom()
    }
}

