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
        if currentOperand == "0" {
            currentOperator = newOperator
            return
        }
        let text = currentOperator == "" ? "" : currentOperator
        delegate?.addFormulaStackView(operand: currentOperand, operator: text)
        currentOperator = newOperator
        
        formulaExpression += currentOperand + currentOperator
        currentOperand = "0"
    }
    
    mutating func tapDotButton() {
        if currentOperand.contains(".") {
            return
        }
        currentOperand += "."
        delegate?.updateOperandLabel(with: currentOperand)
    }
    
    mutating func tapPlusMinusButton() {
        if currentOperand.hasPrefix("-") {
            currentOperand = currentOperand.replacingOccurrences(of: "-", with: "")
        } else {
            currentOperand = "-" + currentOperand
        }
    }
    
    mutating func tapCEButton() {
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
    
    private mutating func reset() {
        currentOperand = "0"
        currentOperator = ""
        hasCalculated = false
        formulaExpression = ""
    }
}
