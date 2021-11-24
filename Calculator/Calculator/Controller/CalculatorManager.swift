//
//  CalculatorManager.swift
//  Calculator
//
//  Created by 권나영 on 2021/11/23.
//

import Foundation

protocol CalculatorManagerDelegate {
    func updateOperandLabel(with newOperand: String)
    func updateOperatorLabel(with newOperator: String)
    func addFormulaStackView(operand: String, operator: String )
    func clearFormulaStackView()
}

struct CalculatorManager {
    
    //MARK: - Properties
    
    private var currentOperand: String = "0" {
        didSet {
            if hasCalculated {
                return
            }
            delegate?.updateOperandLabel(with: currentOperand)
        }
    }
    private var currentOperator: String = "" {
        didSet {
            if hasCalculated {
                return
            }
            delegate?.updateOperatorLabel(with: currentOperator)
        }
    }
    private var hasCalculated: Bool = false
    private var formulaExpression = String()
    var delegate: CalculatorManagerDelegate?
    
    //MARK: - Method
    
    mutating func tapNumberPad(_ newOperand: String) {
        let text = currentOperand == "0" ? newOperand : currentOperand + newOperand
        setOperand(by: text)
    }
    
    mutating func tapOperatorButton(_ newOperator: String) {
        if currentOperand == "0" {
            setOperator(by: newOperator)
            return
        }
        delegate?.addFormulaStackView(operand: currentOperand, operator: currentOperator)
        setOperator(by: newOperator)
        addFormulaExpression()
        setOperand(by: "0")
    }
    
    mutating func tapDotButton() {
        if currentOperand.contains(".") {
            return
        }
        setOperand(by: currentOperand + ".")
    }
    
    mutating func tapPlusMinusButton() {
        if currentOperand == "0" {
            return
        }
        if currentOperand.hasPrefix("-") {
            currentOperand = currentOperand.replacingOccurrences(of: "-", with: "")
        } else {
            setOperand(by: "-" + currentOperand)
        }
    }
    
    mutating func tapCEButton() {
        if hasCalculated {
            reset()
            delegate?.clearFormulaStackView()
        }
        if currentOperand.count == 1 {
            currentOperand = "0"
            return
        }
        currentOperand.removeLast()
    }
    
    mutating func tapACButton() {
        reset()
        delegate?.clearFormulaStackView()
    }
    
    mutating func tapEqualButton() {
        if hasCalculated || currentOperand == "0" {
            return
        }
        delegate?.addFormulaStackView(operand: currentOperand, operator: currentOperator)
        addFormulaExpression()
        calculateFormula()
        setOperator(by: "")
        hasCalculated = true
    }
    
    private mutating func setOperand(by value: String) {
        currentOperand = value
    }
    
    private mutating func setOperator(by value: String) {
        currentOperator = value
    }
    
    private mutating func reset() {
        hasCalculated = false
        currentOperand = "0"
        currentOperator = ""
        formulaExpression = ""
    }
    
    private mutating func addFormulaExpression() {
        formulaExpression += currentOperand + currentOperator
    }
    
    private mutating func calculateFormula() {
        do {
            var formula = ExpressionParser.parse(from: formulaExpression)
            guard let formattedResult = setNumberFormat(for: try formula.result()) else {
                return
            }
            currentOperand = formattedResult
        } catch CalculatorError.divideByZero {
            currentOperand = "NaN"
        } catch {
            print(error)
        }
    }
    
    private func setNumberFormat(for value: Double) -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 20
        numberFormatter.roundingMode = .up
        return numberFormatter.string(for: value)
    }
}
