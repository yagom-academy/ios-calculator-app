//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    private let calculatorManager = CalculatorManager(isCalculating: false)
    
    private var displayOperator: String {
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
    
    @IBOutlet weak var formulasScrollView: UIScrollView!
    @IBOutlet weak var formulasStackView: UIStackView!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var operandLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initOperandLabel()
        initOperatorLabel()
        initformulasStackView()
    }
}

// MARK: - Actions

extension ViewController {
    @IBAction private func touchUpDigit(_ sender: UIButton) {
        guard let currentOperandLabelTitle = operandLabel.text else {
            return
        }
        
        guard let currentOperandButtonTitle = sender.currentTitle else {
            return
        }
    
        if currentOperandLabelTitle == "0" {
            operandLabel.text = currentOperandButtonTitle
        } else {
            operandLabel.text = currentOperandLabelTitle + currentOperandButtonTitle
        }
    }
    
    @IBAction private func touchUpDecimalPoint(_ sender: UIButton) {
        guard let currentOperandLabelTitle = operandLabel.text else {
            return
        }
        
        guard let decimalPointButtonTitle = sender.currentTitle else {
            return
        }
        
        guard !currentOperandLabelTitle.contains(".") else { return }
        
        operandLabel.text = currentOperandLabelTitle + decimalPointButtonTitle
    }
    
    @IBAction private func touchUpOperator(_ sender: UIButton) {
        guard let currentOperatorLabelTitle = operatorLabel.text else {
            return
        }
        
        guard let currentOperandLabelTitle = operandLabel.text else {
            return
        }
        
        guard let currentOperandButtionTitle = sender.currentTitle else {
            return
        }
        
        appendFormulaToformulas(operator: currentOperatorLabelTitle,
                                operand: currentOperandLabelTitle)
        
        operatorLabel.text = currentOperandButtionTitle
        initOperandLabel()
    }
    
    @IBAction private func touchUpAllClear(_ sender: UIButton) {
        initAllDisplay()
    }
    
    @IBAction private func touchUpClearError(_ sender: UIButton) {
        
    }
    
    @IBAction private func touchUpSignConversion(_ sender: UIButton) {
        guard let currentOperandLabelTitle = operandLabel.text else {
            return
        }
        
        guard currentOperandLabelTitle != "0" else {
            return
        }
        
        let convertedOperand = convertSign(from: currentOperandLabelTitle)
        operandLabel.text = convertedOperand
    }
    
    @IBAction private func touchUpEqualSign(_ sender: UIButton) {
        guard let currentOperatorLabelTitle = operatorLabel.text else {
            return
        }
        
        guard let currentOperandLabelTitle = operandLabel.text else {
            return
        }
        
        appendFormulaToformulas(operator: currentOperatorLabelTitle,
                                operand: currentOperandLabelTitle)
        
        let formulaString: String = assembleFormula()
        var formula: Formula = ExpressionParser.parse(from: formulaString)
        
        do {
            operandLabel.text = String(try formula.result())
        } catch OperationError.devidedByZero {
            operandLabel.text = "NaN"
        } catch {
            print(error.localizedDescription)
        }
    }
}

// MARK: - private Methods

extension ViewController {
    func initOperatorLabel() {
        operatorLabel.text = ""
    }
    
    func initOperandLabel() {
        operandLabel.text = "0"
    }
    
    func initformulasStackView() {
        formulasStackView.arrangedSubviews.forEach { $0.removeFromSuperview()}
    }
    
    func initAllDisplay() {
        initOperatorLabel()
        initOperandLabel()
        initformulasStackView()
    }
    
    func appendFormulaToformulas(`operator`: String, operand: String) {
        let formulaRowStackView: UIStackView = UIStackView()
        let operatorLabel: UILabel = UILabel()
        let operandLabel: UILabel = UILabel()
        
        operatorLabel.text = `operator`
        operandLabel.text = operand
        operatorLabel.textColor = .white
        operandLabel.textColor = .white
        
        
        formulaRowStackView.axis = .horizontal
        formulaRowStackView.alignment = .fill
        formulaRowStackView.spacing = 8
        
        formulaRowStackView.addArrangedSubview(operatorLabel)
        formulaRowStackView.addArrangedSubview(operandLabel)
        
        formulasStackView.addArrangedSubview(formulaRowStackView)
    }
    
    func convertSign(from operand: String) -> String {
        guard let sign = operand.first, sign == "-" else {
            return "-" + operand
        }
        let signIndex: String.Index = operand.index(operand.startIndex, offsetBy: 1)
        return String(operand[signIndex...])
    }
    
    func assembleFormula() -> String {
        var result: [String] = []
        
        formulasStackView.arrangedSubviews.forEach {
            let smallStackView = $0 as? UIStackView
            smallStackView?.arrangedSubviews.forEach {
                let label = $0 as? UILabel
                guard let text = label?.text, text != "" else { return }
                result.append(text)
            }
        }
        
        return result.joined(separator: " ")
    }
    
}
