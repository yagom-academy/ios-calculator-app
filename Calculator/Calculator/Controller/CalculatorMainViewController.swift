//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class CalculatorMainViewController: UIViewController {
    // MARK: - IBOutlet
    
    @IBOutlet private weak var calculatorScrollView: UIScrollView!
    @IBOutlet private weak var calculatorStackView: UIStackView!
    @IBOutlet private weak var operandLabel: UILabel!
    @IBOutlet private weak var operatorLabel: UILabel!
    
    // MARK: - Property
    
    private let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 15
        formatter.roundingMode = .halfDown

        return formatter
    }()
    
    private var operatorsAndOperandsInput: String = ""
    private var isFormulaEnd: Bool = false
    
    // MARK: - View State Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
    }
    
    // MARK: - IBAction
    
    @IBAction private func touchUpPointButton(_ sender: UIButton) {
        guard !isFormulaEnd else {
            return
        }
        
        let currentNumberText = operandLabel.text ?? ""
        let newPointText = sender.titleLabel?.text ?? "."
        let isPoint = currentNumberText.contains(".")
        
        if isPoint == false && currentNumberText != "NaN" {
            operandLabel.text = currentNumberText + newPointText
        }
    }
    
    @IBAction private func touchUpNumberButton(_ sender: UIButton) {
        if isFormulaEnd {
            appendCalculateItem()
            operatorsAndOperandsInput = ""
            isFormulaEnd = false
            clearEntry()
        }
        
        guard
            var operandLabelText = removeComma(of: operandLabel.text),
            operandLabelText.count < 20
        else {
            return
        }

        operandLabelText.append(sender.titleLabel?.text ?? "")
        let number = Decimal(string: operandLabelText)
        
        operandLabel.text = formatNumber(of: number)
    }
    
    @IBAction private func touchUpZeroButton(_ sender: UIButton) {
        if isFormulaEnd {
            appendCalculateItem()
            operatorsAndOperandsInput = ""
            isFormulaEnd = false
            clearEntry()
        }
        
        guard
            let operandLabelText = operandLabel.text,
            operandLabelText != "NaN",
            operandLabelText != "0" || operandLabelText.contains("."),
            operandLabelText.count < 20
        else {
            return
        }
        
        operandLabel.text?.append(sender.titleLabel?.text ?? "")
    }
    
    @IBAction private func touchUpOperatorButton(_ sender: UIButton) {
        guard
            let operandLabelText = removeComma(of: operandLabel.text),
            operandLabelText != "NaN",
            let number = Decimal(string: operandLabelText),
            !operatorsAndOperandsInput.isEmpty || !number.isZero
        else {
            return
        }
        
        isFormulaEnd = false
        
        guard formatNumber(of: Decimal(string: operandLabel.text ?? "")) != "0" else {
            operatorLabel.text = sender.titleLabel?.text
            return
        }
        
        appendCalculateItem()
        
        operatorLabel.text = sender.titleLabel?.text
        clearEntry()
    }
    
    @IBAction private func touchUpClearEntryButton(_ sender: UIButton) {
        if isFormulaEnd {
            appendCalculateItem()
            operatorsAndOperandsInput = ""
            isFormulaEnd = false
        }
        
        clearEntry()
    }
    
    @IBAction private func touchUpAllClearButton(_ sender: UIButton) {
        clearAll()
    }
    
    @IBAction private func touchUpEqualsButton(_ sender: UIButton) {
        guard !operatorsAndOperandsInput.isEmpty else {
            return
        }
        
        do {
            appendCalculateItem()
            operandLabel.text = formatNumber(of: try calculate())
        } catch let error as CalculatorError {
            switch error {
            case .divideError:
                operandLabel.text = "NaN"
            }
        } catch {
            print("알 수 없는 에러 발생")
        }
    }
    
    @IBAction private func touchUpChangeSignButton(_ sender: UIButton) {
        guard
            var operandLabelText = removeComma(of: operandLabel.text),
            let number = Decimal(string: operandLabelText),
            !number.isZero
        else {
            return
        }
        
        if operandLabelText.contains("-") {
            operandLabelText.removeFirst()
        } else {
            operandLabelText = "-\(operandLabelText)"
        }
        
        operandLabel.text = operandLabelText
    }
    
    // MARK: - Method
    
    private func formatNumber(of number: Any?) -> String? {
        return numberFormatter.string(for: number)
    }
    
    private func clearAll() {
        calculatorStackView.arrangedSubviews.forEach { view in
            view.removeFromSuperview()
        }
        
        clearOperator()
        clearEntry()
        operatorsAndOperandsInput = ""
        isFormulaEnd = false
    }
    
    private func clearEntry() {
        operandLabel.text = "0"
    }
    
    private func clearOperator() {
        operatorLabel.text = nil
    }
    
    private func removeComma(of text: String?) -> String? {
        return text?.components(separatedBy: ",").joined()
    }
    
    private func createUILabel(text: String?) -> UILabel {
        let label = UILabel()
        label.textColor = .white
        label.text = text
        
        return label
    }
    
    private func appendCalculateItem() {
        guard let operandLabelText = removeComma(of: operandLabel.text) else {
            return
        }
        
        var formattedNumber: String?
        
        if operandLabelText == "NaN" {
            formattedNumber = operandLabelText
        } else {
            formattedNumber = formatNumber(of: Decimal(string: operandLabelText))
        }
        
        let operatorLabel = createUILabel(text: self.operatorLabel.text)
        let operandLabel = createUILabel(text: formattedNumber)
        
        if operandLabel.text?.last == "." {
            operandLabel.text?.removeLast()
        }
        
        let calculateItemStackView = createCalculateItemStackView(operatorLabel, operandLabel)
        
        calculatorStackView.addArrangedSubview(calculateItemStackView)
        
        operatorsAndOperandsInput.append(operatorLabel.text ?? "")
        operatorsAndOperandsInput.append(operandLabel.text ?? "")
        
        scrollToBottom()
    }
    
    private func createCalculateItemStackView(_ labels: UILabel...) -> UIStackView {
        let stackView = UIStackView()
        stackView.spacing = 8.0
        
        labels.forEach { stackView.addArrangedSubview($0) }
        
        return stackView
    }
    
    private func calculate() throws -> Double {
        var formula = ExpressionParser.parse(from: operatorsAndOperandsInput)
        
        clearOperator()
        operatorsAndOperandsInput = ""
        isFormulaEnd = true
        
        return try formula.result()
    }
    
    private func scrollToBottom() {
        calculatorScrollView.layoutIfNeeded()
        
        let bottomOffset = CGPoint(
            x: 0,
            y: calculatorScrollView.contentSize.height
            - calculatorScrollView.bounds.height
            + calculatorScrollView.contentInset.bottom
        )
        
        calculatorScrollView.setContentOffset(bottomOffset, animated: true)
    }
}

