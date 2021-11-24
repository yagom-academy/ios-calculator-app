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
    
    var delegate: CalculatorManagerDelegate?
    
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
    private var hasCalculated = false
    private var formulaExpression = String()
    private let zero = "0"
    private let emptyString = ""
    private let notANumber = "NaN"
    
    //MARK: - Method
    
    mutating func tapNumberPad(_ newOperand: String) {
        let operand = currentOperand == zero ? newOperand : currentOperand + newOperand
        setOperand(value: operand)
    }
    
    mutating func tapOperatorButton(_ newOperator: String) {
        if currentOperand == zero {
            setOperator(value: newOperator)
            return
        }
        delegate?.addFormulaStackView(operand: currentOperand, operator: currentOperator)
        setOperator(value: newOperator)
        addFormulaExpression()
        setOperand(value: zero)
    }
    
    mutating func tapDotButton() {
        let dotSign = "."
        if currentOperand.contains(dotSign) {
            return
        }
        setOperand(value: currentOperand + dotSign)
    }
    
    mutating func tapPlusMinusButton() {
        guard currentOperand != zero else {
            return
        }
        let minusSign = String(Operator.subtract.rawValue)
        if currentOperand.hasPrefix(minusSign) {
            setOperand(value: currentOperand.replacingOccurrences(of: minusSign, with: emptyString))
        } else {
            setOperand(value: minusSign + currentOperand)
        }
    }
    
    mutating func tapCEButton() {
       guard hasCalculated == false else {
           reset()
           return
        }
        if currentOperand.count == 1 {
            setOperand(value: zero)
            return
        }
        currentOperand.removeLast()
    }
    
    mutating func tapACButton() {
        reset()
    }
    
    mutating func tapEqualButton() {
        if hasCalculated || currentOperand == zero {
            return
        }
        delegate?.addFormulaStackView(operand: currentOperand, operator: currentOperator)
        addFormulaExpression()
        calculateFormula()
        setOperator(value: emptyString)
        hasCalculated = true
    }
    
    private mutating func setOperand(value: String) {
        currentOperand = value
    }
    
    private mutating func setOperator(value: String) {
        currentOperator = value
    }
    
    private mutating func reset() {
        hasCalculated = false
        currentOperand = zero
        currentOperator = emptyString
        formulaExpression = emptyString
        delegate?.clearFormulaStackView()
    }
    
    private mutating func addFormulaExpression() {
        formulaExpression += currentOperand + currentOperator
    }
    
    private mutating func calculateFormula() {
        do {
            var formula = ExpressionParser.parse(from: formulaExpression)
            let result = try formula.result()
            guard let formattedResult = setNumberFormat(for: result) else {
                return
            }
            setOperand(value: formattedResult)
        } catch CalculatorError.divideByZero {
            setOperand(value: notANumber)
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
