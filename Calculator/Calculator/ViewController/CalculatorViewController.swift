//
//  Calculator - ViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import UIKit

final class CalculatorViewController: UIViewController {
    private var userTyping = false
    private var formula = ""
    private let numberFormatter = NumberFormatter()
    
    @IBOutlet weak var displayOperandLabel: UILabel!
    @IBOutlet weak var displayOperatorLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNumberFormatter()
        clearStackView()
        clearOperandLabel()
        clearOperatorLabel()
    }
    
    @IBAction private func touchDigitButton(_ sender: UIButton) {
        guard let digit = sender.currentTitle else { return }
        
        addDisplayOperandsLabel(digit)
    }
    
    @IBAction private func touchOperatorButton(_ sender: UIButton) {
        guard let inputOperator = sender.currentTitle else { return }
        
        addFormula()
        displayOperatorLabel.text = inputOperator
    }
    
    @IBAction private func touchCalculateButton(_ sender: UIButton) {
        guard let operands = displayOperandLabel.text,
              let `operator` = displayOperatorLabel.text else { return }
        
        addFormula()
        
        guard let result = calculateFormula() else { return }
        
        if `operator` == String(Operator.divide.rawValue) && operands == CalculatorSigns.zero {
            displayOperandLabel.text = CalculatorSigns.notaNumber
        } else {
            displayOperandLabel.text = result
            clearStackView()
        }
        clearFormula()
        clearOperatorLabel()
    }

    @IBAction private func touchMenuButton(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
        
        switch title {
        case CalculatorSigns.allClear:
            clearOperandLabel()
            clearOperatorLabel()
            clearStackView()
            clearFormula()
        case CalculatorSigns.clearEntry:
            clearOperandLabel()
        case CalculatorSigns.changeSign:
            changeSign()
        default:
            break
        }
    }
    
    private func addDisplayOperandsLabel(_ input: String) {
        guard let operand = displayOperandLabel.text?.replacingOccurrences(of: CalculatorSigns.decimalSign, with: ""),
              let operand2 = displayOperandLabel.text,
              let number = Double(operand + input),
              let formattedOperand = numberFormatter.string(for: number) else { return }
        
        if input == CalculatorSigns.dot && operand.contains(CalculatorSigns.dot) == false {
            let result = formattedOperand + input
            displayOperandLabel.text = result
        } else if (input == CalculatorSigns.doubleZero || input == CalculatorSigns.zero) && operand.contains(CalculatorSigns.dot) {
            let result = operand2 + input
            displayOperandLabel.text = result
        } else {
            displayOperandLabel.text = formattedOperand
        }
    }
    
    private func addFormula() {
        guard let operands = displayOperandLabel.text?.replacingOccurrences(of: CalculatorSigns.decimalSign, with: ""),
              let `operator` = displayOperatorLabel.text else { return }
        
        if operands != CalculatorSigns.zero && `operator`.isEmpty {
            formula += operands
            addStackView("", operands)
        } else if operands != CalculatorSigns.zero || (`operator` == String(Operator.divide.rawValue) && operands == CalculatorSigns.zero) {
            formula += " \(`operator`) \(operands)"
            addStackView(`operator`, operands)
        }
                
        clearOperandLabel()
        clearOperatorLabel()
        
    }
    
    private func addStackView(_ `operator`: String, _ operands: String) {
        let stackViewLabel = UILabel()
        stackViewLabel.textColor = .white
        stackViewLabel.textAlignment = .center
        stackViewLabel.font = .boldSystemFont(ofSize: 20)
        stackViewLabel.text = "\(`operator`) \(operands)"
        
        stackView.addArrangedSubview(stackViewLabel)
    }
    
    private func calculateFormula() -> String? {
        var parsedValue = ExpressionParser.parse(from: formula)
        let result = parsedValue.result()
        
        userTyping = true
        
        return numberFormatter.string(for: result)
    }
    
    private func changeSign() {
        guard var operands = displayOperandLabel.text, operands != CalculatorSigns.zero else { return }
        
        if operands.contains(CalculatorSigns.minusSign) {
            operands.removeFirst()
        } else {
            operands.insert(Character(CalculatorSigns.minusSign), at: operands.startIndex)
        }
        
        displayOperandLabel.text = operands
    }

    private func clearFormula() {
        formula.removeAll()
    }
    
    private func clearOperandLabel() {
        displayOperandLabel.text = CalculatorSigns.zero
    }
    
    private func clearOperatorLabel() {
        displayOperatorLabel.text?.removeAll()
    }
    
    private func clearStackView() {
        stackView.arrangedSubviews.forEach{ $0.removeFromSuperview() }
    }
    
    private func setNumberFormatter() {
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20
        numberFormatter.maximumIntegerDigits = 20
        numberFormatter.maximumSignificantDigits = 20
        numberFormatter.usesSignificantDigits = true
    }
}

extension CalculatorViewController {
    enum CalculatorSigns {
        static let dot = "."
        static let zero = "0"
        static let doubleZero = "00"
        static let minusSign = "-"
        static let allClear = "AC"
        static let clearEntry = "CE"
        static let changeSign = "⁺⁄₋"
        static let decimalSign = ","
        static let notaNumber = "NaN"
    }
}
