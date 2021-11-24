//
//  CalculatorManager.swift
//  Calculator
//
//  Created by 권나영 on 2021/11/23.
//

import Foundation

protocol CalculatorManagerDelegate {
    func updateOperandLabel(by newOperand: String)
    func updateOperatorLabel(by newOperator: String)
}

struct CalculatorManager {
    
    //MARK: - Properties
    
    private var currentOperand: String = "0" {
        didSet {
            delegate?.updateOperandLabel(by: currentOperand)
        }
    }
    private var currentOperator: String = "" {
        didSet {
            delegate?.updateOperatorLabel(by: currentOperator)
        }
    }
    private var hasCalculated: Bool = false
    
    var delegate: CalculatorManagerDelegate?
    
    //MARK: - Method
    
    mutating func tapNumberPad(_ operand: String) {
        if currentOperand == "0" {
            delegate?.updateOperandLabel(by: operand)
            currentOperand = operand
            return
        }
        currentOperand += operand
    }
    
    mutating func tapOperatorButton(_ newOperatpr: String) {
        currentOperator = newOperatpr
    }
    
    mutating func tapDotButton() {
        if currentOperand.contains(".") {
            return
        }
        currentOperand += "."
        delegate?.updateOperandLabel(by: currentOperand)
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
    }
    
    private mutating func reset() {
        currentOperand = "0"
        currentOperator = ""
        hasCalculated = false
    }
}
