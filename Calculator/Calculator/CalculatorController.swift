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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Method
extension CalculatorController {
    private func changeNumberLabel(text: String) {
        let currentText = numberLabel.text ?? "0"
        
        guard currentText != "0" ||
              text != "00" else {
                  return
        }
        
        if currentText == "0" {
            numberLabel.text = text
        } else {
            numberLabel.text = currentText + text
        }
    }
    
    private func appendExpressionNumber() {
        guard let number = numberLabel.text else { return }
        
        expressionInput.append(number)
    }
    
    private func appendExpressionOperator() {
        guard let `operator` = operatorLabel.text else { return }
        
        var hasOprator = false
        Operator.allCases.forEach {
            hasOprator = hasOprator == expressionInput.hasSuffix(String($0.rawValue))
        }
        
        if hasOprator {
            expressionInput.removeLast()
        }
        
        expressionInput.append(`operator`)
    }
    
    private func resetNumberLabel() {
        numberLabel.text = "0"
    }
    
    private func resetOperatorLabel() {
        operatorLabel.text = String()
    }
    
    private func resetExpressionInput() {
        expressionInput = String()
    }
    
    private func createExpressionStackView() {
        let operatorLabel = UILabel()
        operatorLabel.text = self.operatorLabel.text
        operatorLabel.textColor = .white
        operatorLabel.sizeToFit()
        
        let operandLabel = UILabel()
        operandLabel.text = self.numberLabel.text
        operandLabel.textColor = .white
        operandLabel.sizeToFit()
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.addArrangedSubview(operatorLabel)
        stackView.addArrangedSubview(operandLabel)
        stackView.spacing = 8
        
        expressionStackViewSuperView.addArrangedSubview(stackView)
    }
    
    private func clearExpressionsStackView() {
        expressionStackViewSuperView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
}

// MARK: - Button Event
extension CalculatorController {
    
    @IBAction func touchUpOperandButton(_ sender: UIButton) {
        guard let operand = sender.currentTitle else { return }
        
        changeNumberLabel(text: operand)
    }
    
    @IBAction func touchUpDotButton(_ sender: UIButton) {
        guard let dot = sender.currentTitle else { return }
        
        if numberLabel.text?.contains(dot) == false {
            let currentText = numberLabel.text ?? "0"
            
            numberLabel.text = currentText + dot
        }
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        guard let `operator` = sender.currentTitle else { return }
        
        guard numberLabel.text != "0" else {
            operatorLabel.text = `operator`
            appendExpressionOperator()
            return
        }
        
        createExpressionStackView()
        
        operatorLabel.text = `operator`
        
        appendExpressionNumber()
        appendExpressionOperator()
        resetNumberLabel()
    }

    @IBAction func touchUpPlusMinusButton(_ sender: UIButton) {
        guard numberLabel.text != "0" else {
            return
        }
        
        var currentText = numberLabel.text ?? "0"
        let minusSign = "-"
        
        if numberLabel.text?.hasPrefix(minusSign) == true {
            currentText = currentText.replacingOccurrences(of: "-", with: "")
        } else {
            currentText = minusSign + currentText
        }
        
        numberLabel.text = currentText
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
            numberLabel.text = String(result)
            
            resetExpressionInput()
        } catch OperatorError.divideByZero {
            numberLabel.text = "NaN"
        } catch {
            return
        }
    }
}
