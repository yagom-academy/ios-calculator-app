//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorMainViewController: UIViewController {
    // MARK: - IBOutlet
    
    @IBOutlet weak var calculatorScrollView: UIScrollView!
    @IBOutlet weak var calculatorStackView: UIStackView!
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    // MARK: - Property
    
    private let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 15
        formatter.roundingMode = .halfDown

        return formatter
    }()
    
    private var operatorsAndOperandsInput: String = ""
    
    // MARK: - View State Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
    }
    
    // MARK: - IBAction
    
    @IBAction func touchUpPointButton(_ sender: UIButton) {
        let currentNumberText = operandLabel.text ?? "0"
        let newPointText = sender.titleLabel?.text ?? "."
        let isPoint = currentNumberText.contains(".")
        
        if isPoint == false {
            operandLabel.text = currentNumberText + newPointText
        }
    }
    
    @IBAction func touchUpNumberButton(_ sender: UIButton) {
        let newNumberText = sender.titleLabel?.text ?? "0"
        var number: Decimal? = Decimal()
        
        guard
            let operandLabelText = removeComma(of: operandLabel.text),
            operandLabelText.count < 20
        else {
            return
        }
        
        guard operandLabelText == "0" else {
            number = Decimal(string: operandLabelText + newNumberText)
            operandLabel.text = formatNumber(of: number)
            return
        }
        
        guard newNumberText == "00" else {
            number = Decimal(string: newNumberText)
            operandLabel.text = formatNumber(of: number)
            return
        }
    }
    
    @IBAction func touchUpZeroButton(_ sender: UIButton) {
        guard
            let operandLabelText = operandLabel.text,
            operandLabelText != "0" || operandLabelText.contains("."),
            operandLabelText.count < 20
        else {
            return
        }
        
        operandLabel.text?.append(sender.titleLabel?.text ?? "")
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        
        guard !operatorsAndOperandsInput.isEmpty || (operandLabel.text != "0") else {
            return
        }
        
        guard formatNumber(of: Decimal(string: operandLabel.text ?? "")) != "0" else {
            operatorLabel.text = sender.titleLabel?.text
            return
        }
        
        appendCalculateItem()
        
        operatorLabel.text = sender.titleLabel?.text
        clearEntry()
        
    }
    
    @IBAction func touchUpClearEntryButton(_ sender: UIButton) {
        clearEntry()
    }
    
    
    @IBAction func touchUpAllClearButton(_ sender: UIButton) {
        clearAll()
    }
    
    @IBAction func touchUpEqualsButton(_ sender: UIButton) {
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
    
    @IBAction func touchUpChangeSignButton(_ sender: UIButton) {
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
    
    func updateCalculatorRecordView(by newOperator: String, and newOperand: String) {
        let newOperandLabel: UILabel = createUILabel(text: newOperand)
        let newOperatorLabel: UILabel = createUILabel(text: newOperator)
        let newStackVIew = createUIStackView(laber: newOperatorLabel, newOperandLabel)
        
        calculatorStackView.addArrangedSubview(newStackVIew)
    }
    
    private func createUILabel(text: String?) -> UILabel {
        let label = UILabel()
        label.textColor = .white
        label.text = text
        
        return label
    }
    
    private func createUIStackView(laber: UILabel...) -> UIStackView {
        let newStackView = UIStackView()
        newStackView.spacing = 8
        newStackView.axis = .horizontal
        newStackView.alignment = .fill
        newStackView.distribution = .fill
        
        
        laber.forEach{ newStackView.addArrangedSubview($0) }
        
        return newStackView
    }
    
    func updateScrollFocus() {
        calculatorScrollView.layoutIfNeeded()
        
        let scrollViewHeigth =
        calculatorScrollView.contentSize.height - calculatorScrollView.bounds.height
        
        calculatorScrollView
            .setContentOffset(CGPoint(x: 0, y: scrollViewHeigth), animated: true)
    }
    
    private func appendCalculateItem() {
        guard
            let operandLabelText = removeComma(of: operandLabel.text),
            let formattedNumber = formatNumber(of: Decimal(string: operandLabelText))
        else {
            return
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

