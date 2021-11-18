//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorController: UIViewController {

    @IBOutlet weak private var numberLabel: UILabel!
    @IBOutlet weak private var operatorLabel: UILabel!
    @IBOutlet weak private var expressionStackViewSuperView: UIStackView!
    
    private var expressionInput: String = String()
    
    private let numberFormatter = NumberFormatter()
    
    private var hasSuffixOperator: Bool {
        get {
            return Operator.allCases.reduce(false) {
                $0 == expressionInput.hasSuffix(String($1.rawValue))
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initNumberFormatter()
    }
    
    private func initNumberFormatter() {
        numberFormatter.roundingMode = .ceiling
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20
    }
}

// MARK: - Method
extension CalculatorController {
    private func appendExpressionNumber() {
        guard let numberText = numberLabel.text else { return }
        let number = removeComma(text: numberText)
        
        expressionInput.append(number)
    }
    
    private func appendExpressionOperator() {
        guard let `operator` = operatorLabel.text else { return }
        
        if hasSuffixOperator {
            expressionInput.removeLast()
        }
        
        expressionInput.append(`operator`)
    }
    
    private func resetExpressionInput() {
        expressionInput = String()
    }
    
    private func removeComma(text: String?) -> String {
        return text?.replacingOccurrences(of: ",", with: "") ?? ""
    }
    
    private func togglePlusMinus() -> String {
        var currentText = numberLabel.text ?? "0"
        let minusSign = "-"
        
        if currentText.hasPrefix(minusSign) == true {
            currentText = currentText.replacingOccurrences(of: minusSign , with: "")
        } else {
            currentText = minusSign + currentText
        }
        
        return currentText
    }
}

// MARK: - Button Event
extension CalculatorController {
    
    @IBAction func touchUpOperandButton(_ sender: UIButton) {
        guard let operand = sender.currentTitle else { return }
        
        changeNumberLabel(text: operand)
    }
    
    @IBAction func touchUpDotButton(_ sender: UIButton) {
        insertDot()
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        guard let `operator` = sender.currentTitle else { return }
        
        guard numberLabel.text != "0" else {
            changeOperatorLabel(text: `operator`)
            appendExpressionOperator()
            return
        }
        
        createExpressionStackView()
        changeOperatorLabel(text: `operator`)
        appendExpressionNumber()
        appendExpressionOperator()
        resetNumberLabel()
    }

    @IBAction func touchUpPlusMinusButton(_ sender: UIButton) {
        guard numberLabel.text != "0" else {
            return
        }
        
        numberLabel.text = togglePlusMinus()
    }
    
    @IBAction func touchUpClearEntryButton(_ sender: UIButton) {
        resetNumberLabel()
    }
    
    
    @IBAction func touchUpAllClearButton(_ sender: UIButton) {
        resetNumberLabel()
        resetOperatorLabel()
        resetExpressionInput()
        clearExpressionsStackView()
    }
    
    @IBAction func touchUpResultButton(_ sender: UIButton) {
        guard let `operator` = operatorLabel.text,
              `operator` != "" else { return }
        
        do {
            createExpressionStackView()
            appendExpressionNumber()
            resetOperatorLabel()
            
            let formula = ExpressionParser.parse(form: expressionInput)
            let result = try formula.result()
            numberLabel.text = numberFormatter.string(for: result)
            
            resetExpressionInput()
        } catch OperatorError.divideByZero {
            showNotANumber()
        } catch {
            return
        }
    }
}

// MARK: - View Method
extension CalculatorController {
    
    private func changeNumberLabel(text: String) {
        var currentText = numberLabel.text ?? "0"
        
        guard currentText != "0" ||
              text != "00" else {
                  return
        }
        
        if currentText == "0" {
            currentText = text
        } else {
            currentText += text
        }
        
        let numberLabelText = removeComma(text: currentText)
        let number = Double(numberLabelText)
        numberLabel.text = numberFormatter.string(for: number)
    }
    
    private func resetNumberLabel() {
        numberLabel.text = "0"
    }

    private func insertDot() {
        let dot = "."
        
        if numberLabel.text?.contains(dot) == false {
            let currentText = numberLabel.text ?? "0"
            
            numberLabel.text = currentText + dot
        }
    }
    
    private func showNotANumber() {
        numberLabel.text = "NaN"
    }
    
    private func changeOperatorLabel(text: String) {
        operatorLabel.text = text
    }
    
    private func resetOperatorLabel() {
        operatorLabel.text = String()
    }
    
    private func createLabel(text: String?) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .white
        label.sizeToFit()
        
        return label
    }
    
    private func createStackView(subviews: UIView..., axis: NSLayoutConstraint.Axis = .horizontal) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.spacing = 8
        subviews.forEach { stackView.addArrangedSubview($0) }
        
        return stackView
    }
    
    private func createExpressionStackView() {
        let operatorLabel = createLabel(text: self.operatorLabel.text)
        let operandLabel = createLabel(text: self.numberLabel.text)
        
        let stackView = createStackView(subviews: operatorLabel, operandLabel)
        
        expressionStackViewSuperView.addArrangedSubview(stackView)
    }
    
    private func clearExpressionsStackView() {
        expressionStackViewSuperView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
}
