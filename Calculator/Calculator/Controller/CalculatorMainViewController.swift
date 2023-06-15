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
    
    private var operatorsAndOperandsInput: String = ""
    private var isFormulainProcess: Bool = true
    
    private let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 15
        formatter.roundingMode = .halfDown
        
        return formatter
    }()
    
    private var operandLabelText: String {
        return removeComma(of: operandLabel.text)
    }
    
    private var operandLabelNumber: Decimal? {
        return Decimal(string: operandLabelText)
    }
    
    private var isOperandInputPossible: Bool {
        return operandLabelText.count < 20
    }
    
    // MARK: - View State Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
    }
    
    // MARK: - IBAction
    
    @IBAction private func touchUpNumberButton(_ sender: UIButton) {
        if !isFormulainProcess {
            appendCalculateItem()
            clearInput()
            continueFormulaProcess()
            clearEntry()
        }
        
        guard
            isOperandInputPossible,
            let numberText = sender.titleLabel?.text
        else {
            return
        }

        operandLabel.text?.append(numberText)
        operandLabel.text = formatNumber(of: operandLabelNumber)
    }
    
    @IBAction private func touchUpZeroButton(_ sender: UIButton) {
        if !isFormulainProcess {
            appendCalculateItem()
            clearInput()
            continueFormulaProcess()
            clearEntry()
        }
        
        guard
            operandLabelText.isNotNaN,
            operandLabelText != "0" || operandLabelText.contains("."),
            isOperandInputPossible,
            let zeroText = sender.titleLabel?.text
        else {
            return
        }
        
        operandLabel.text?.append(zeroText)
        
        if !operandLabelText.contains(".") {
            operandLabel.text = formatNumber(of: operandLabelNumber)
        }
    }
    
    @IBAction private func touchUpPointButton(_ sender: UIButton) {
        guard
            isFormulainProcess,
            let pointText = sender.titleLabel?.text,
            !operandLabelText.contains(pointText)
        else {
            return
        }
        
        operandLabel.text?.append(pointText)
    }
    
    @IBAction private func touchUpOperatorButton(_ sender: UIButton) {
        guard
            operandLabelText.isNotNaN,
            let operandLabelNumber,
            !operatorsAndOperandsInput.isEmpty || !operandLabelNumber.isZero,
            let operatorText = sender.titleLabel?.text
        else {
            return
        }
        
        continueFormulaProcess()
        
        guard formatNumber(of: operandLabelNumber) != "0" else {
            operatorLabel.text = operatorText
            return
        }
        
        continueFormulaProcess()
        appendCalculateItem()
        operatorLabel.text = operatorText
        clearEntry()
    }
    
    @IBAction private func touchUpClearEntryButton(_ sender: UIButton) {
        if !isFormulainProcess {
            appendCalculateItem()
            clearInput()
            continueFormulaProcess()
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
            let operandLabelNumber,
            !operandLabelNumber.isZero
        else {
            return
        }
        
        if operandLabelText.contains("-") {
            operandLabel.text?.removeFirst()
        } else {
            operandLabel.text = "-\(operandLabelText)"
        }
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
        clearInput()
        continueFormulaProcess()
    }
    
    private func clearEntry() {
        operandLabel.text? = "0"
    }
    
    private func clearOperator() {
        operatorLabel.text = nil
    }
    
    private func clearInput() {
        operatorsAndOperandsInput = ""
    }
    
    func continueFormulaProcess() {
        isFormulainProcess = true
    }
    
    func finishFormulaProcess() {
        isFormulainProcess = false
    }
    
    private func removeComma(of text: String?) -> String {
        guard let text else {
            return ""
        }
        
        return text.components(separatedBy: ",").joined()
    }
    
    private func createUILabel(text: String?) -> UILabel {
        let label = UILabel()
        label.textColor = .white
        label.text = text
        
        return label
    }
    
    private func appendCalculateItem() {
        
        var formattedNumber: String?
        
        if operandLabelText.isNaN {
            formattedNumber = operandLabelText
        } else {
            formattedNumber = formatNumber(of: operandLabelNumber)
        }
        
        let operatorLabel = createUILabel(text: self.operatorLabel.text)
        let operandLabel = createUILabel(text: formattedNumber)
        
        if operandLabelText.last == "." {
            operandLabel.text?.removeLast()
        }
        
        let calculateItemStackView = createCalculateItemStackView(operatorLabel, operandLabel)
        
        calculatorStackView.addArrangedSubview(calculateItemStackView)
        
        operatorsAndOperandsInput.append(operatorLabel.text ?? "")
        operatorsAndOperandsInput.append(operandLabelText)
        
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
        clearInput()
        finishFormulaProcess()
        
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

