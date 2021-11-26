//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    private var calculatorManager = CalculatorManager(displayingResult: false, isTypingOperand: false)
    private var formulasStackViewIsEmpty: Bool = true
    
    private var displayedOperator: String {
        get {
            guard let `operator` = operatorLabel.text else {
                return ""
            }
            
            return `operator`
        }
        set {
            operatorLabel.text = newValue
        }
    }
    
    private var displayedOperand: String {
        get {
            guard let operand = operandLabel.text else {
                return ""
            }
            
            return operand
        }
        set {
            operandLabel.text = calculatorManager.format(of: newValue)
        }
    }
    
    @IBOutlet weak var formulasScrollView: UIScrollView!
    @IBOutlet weak var formulasStackView: UIStackView!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var operandLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initDisplayedOperand()
        initDisplayedOperator()
        initDisplayedFormulas()
    }
}

// MARK: - Actions

extension CalculatorViewController {
    @IBAction private func touchUpDigitButton(_ sender: UIButton) {
        if calculatorManager.displayingResult {
            initDisplayedFormulas()
            initDisplayedOperand()
            calculatorManager.setDisplayingResultStatus(to: false)
        }
        
        if !formulasStackViewIsEmpty && displayedOperator == "" {
            return
        }
        
        guard let currentOperandButtonTitle = sender.currentTitle else {
            return
        }
        
        calculatorManager.setIsTypingOperandStatus(to: true)
        
        if displayedOperand == "0" {
            guard currentOperandButtonTitle != "00" else {
                return
            }
            displayedOperand = currentOperandButtonTitle
        } else {
            displayedOperand = displayedOperand + currentOperandButtonTitle
        }
    }
    
    @IBAction private func touchUpDecimalPointButton(_ sender: UIButton) {
        if calculatorManager.displayingResult {
            initDisplayedFormulas()
            initDisplayedOperand()
            calculatorManager.setDisplayingResultStatus(to: false)
        }
        
        guard let decimalPointButtonTitle = sender.currentTitle else {
            return
        }
        
        calculatorManager.setIsTypingOperandStatus(to: true)
        
        guard !displayedOperand.contains(".") && displayedOperand != "NaN" else {
            return
        }
        
        displayedOperand = displayedOperand + decimalPointButtonTitle
    }
    
    @IBAction private func touchUpOperatorButton(_ sender: UIButton) {
        guard displayedOperand != "NaN" else {
            return
        }
        
        if calculatorManager.displayingResult {
            initDisplayedFormulas()
            calculatorManager.setDisplayingResultStatus(to: false)
        }
        
        guard let currentOperandButtionTitle = sender.currentTitle else {
            return
        }
        
        guard Double(displayedOperand) != 0.0 else {
            displayedOperator = currentOperandButtionTitle
            
            return
        }
        
        addFormula(operator: displayedOperator, operand: displayedOperand)
        displayedOperator = currentOperandButtionTitle
        initDisplayedOperand()
    }
    
    @IBAction private func touchUpAllClearButton(_ sender: UIButton) {
        initAllDisplay()
    }
    
    @IBAction private func touchUpClearEntryButton(_ sender: UIButton) {
        initDisplayedOperand()
        calculatorManager.setDisplayingResultStatus(to: false)
    }
    
    @IBAction private func touchUpSignConversionButton(_ sender: UIButton) {
        guard Double(displayedOperand) != 0.0 else {
            return
        }
        
        let convertedOperand = convertSign(from: &displayedOperand)
        
        displayedOperand = convertedOperand
    }
    
    @IBAction private func touchUpEqualSignButton(_ sender: UIButton) {
        guard displayedOperator != "" && displayedOperand != "" else {
            return
        }
        
        addFormula(operator: displayedOperator, operand: displayedOperand)
        
        let formulaString: String = assembleFormula()
        var formula: Formula = ExpressionParser.parse(from: formulaString)
        
        do {
            displayedOperand = String(try formula.result())
            calculatorManager.setDisplayingResultStatus(to: true)
        } catch OperationError.devidedByZero {
            displayedOperand = "NaN"
            calculatorManager.setDisplayingResultStatus(to: true)
        } catch let error {
            showAlert(message: error.localizedDescription)
        }
        
        initDisplayedOperator()
    }
}

// MARK: - private Methods

extension CalculatorViewController {
    private func initDisplayedOperator() {
        displayedOperator = ""
    }
    
    private func initDisplayedOperand() {
        displayedOperand = "0"
    }
    
    private func initDisplayedFormulas() {
        formulasStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        formulasStackViewIsEmpty = true
    }
    
    private func initAllDisplay() {
        initDisplayedOperator()
        initDisplayedOperand()
        initDisplayedFormulas()
    }
    
    private func scrollToBottom() {
        formulasScrollView.layoutIfNeeded()
        let bottomOffset = CGPoint(x: 0,
                                   y: self.formulasScrollView.contentSize.height
                                    - self.formulasScrollView.bounds.size.height)
        self.formulasScrollView.setContentOffset(bottomOffset, animated: true)
    }
    
    private func addFormula(`operator`: String, operand: String) {
        let formulaRowStackView: UIStackView = UIStackView()
        let operatorLabel: UILabel = UILabel()
        let operandLabel: UILabel = UILabel()
        
        calculatorManager.setIsTypingOperandStatus(to: false)
        
        let (newOperator, newOperand) = convertOperatorAndNegativeOperand(operator: `operator`,
                                                                          operand: operand)

        if !formulasStackViewIsEmpty {
            operatorLabel.text = newOperator
        }
        
        operandLabel.text = calculatorManager.format(of: newOperand)
        operatorLabel.textColor = .white
        operandLabel.textColor = .white
        
        formulaRowStackView.axis = .horizontal
        formulaRowStackView.alignment = .fill
        formulaRowStackView.spacing = 8
        
        formulaRowStackView.addArrangedSubview(operatorLabel)
        formulaRowStackView.addArrangedSubview(operandLabel)
        
        formulasStackView.addArrangedSubview(formulaRowStackView)
        
        formulasStackViewIsEmpty = false
        scrollToBottom()
    }
    
    private func convertOperatorAndNegativeOperand(`operator`: String,
                                                   operand: String) -> (String, String) {
        var newOperand = operand
        
        if operand.hasPrefix("-") {
            switch `operator` {
            case "+":
                return ("−", convertSign(from: &newOperand))
            case "−":
                return ("+", convertSign(from: &newOperand))
            default:
                return (`operator`, operand)
            }
        }
        
        return (`operator`, operand)
    }
    
    private func convertSign(from operand: inout String) -> String {
        if operand.hasPrefix("-") {
            operand.removeFirst()
            
            return operand
        } else {
            return "-" + operand
        }
    }
    
    private func assembleFormula() -> String {
        var result: [String] = []
        
        formulasStackView.arrangedSubviews.forEach {
            let smallStackView = $0 as? UIStackView
            smallStackView?.arrangedSubviews.forEach {
                let label = $0 as? UILabel
                
                guard let text = label?.text, text != "" else {
                    return
                }
                
                result.append(text)
            }
        }
        
        return result.joined(separator: " ")
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
}
