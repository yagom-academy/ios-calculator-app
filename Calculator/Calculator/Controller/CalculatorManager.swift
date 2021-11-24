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
            delegate?.updateOperatorLabel(with: currentOperator)
        }
    }
    private var hasCalculated: Bool = false
    private var formulaExpression = String()
    
    var delegate: CalculatorManagerDelegate?
    
    //MARK: - Method
    
    mutating func tapNumberPad(_ newOperand: String) {
        let text = currentOperand == "0" ? newOperand : currentOperand + newOperand
        currentOperand = text
    }
    
    mutating func tapOperatorButton(_ newOperator: String) {
        if hasCalculated {
            return
        }
        if currentOperand == "0" {
            currentOperator = newOperator
            delegate?.addFormulaStackView(operand: currentOperand, operator: "")
            return
        }
        delegate?.addFormulaStackView(operand: currentOperand, operator: currentOperator)
        currentOperator = newOperator
        addFormulaExpression()
        currentOperand = "0"
    }
    
    mutating func tapDotButton() {
        if currentOperand.contains(".") {
            return
        }
        currentOperand += "."
    }
    
    mutating func tapPlusMinusButton() {
        if currentOperand == "0" {
            return
        }
        if currentOperand.hasPrefix("-") {
            currentOperand = currentOperand.replacingOccurrences(of: "-", with: "")
        } else {
            currentOperand = "-" + currentOperand
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
        if hasCalculated {
            return
        }
        delegate?.addFormulaStackView(operand: currentOperand, operator: currentOperator)
        addFormulaExpression()
        calculateFormula()
        hasCalculated = true
        currentOperator = ""
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
            currentOperand = String(try formula.result())
        } catch CalculatorError.divideByZero {
            currentOperand = "NaN"
        } catch {
            print(error)
        }
    }
}
