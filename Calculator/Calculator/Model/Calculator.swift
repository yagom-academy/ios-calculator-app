//
//  Calculator.swift
//  Calculator
//
//  Created by junho lee on 2022/10/03.
//

import Foundation

struct Calculator {
    static let defaultOperand: String = "0"
    static let defaultOperator: String = ""
    static let negativeSymbol: String = "-"
        
    private(set) var currentOperand: String = defaultOperand
    private(set) var currentOperator: String = defaultOperator
    private var operands: [String] = []
    private var operators: [String] = []
    
    mutating func resetCurrentOperand() {
        currentOperand = Calculator.defaultOperand
    }
    
    mutating func resetCurrentOperator() {
        currentOperator = Calculator.defaultOperator
    }
    
    mutating func clearOperands() {
        operands.removeAll()
    }
    
    mutating func clearOperators() {
        operators.removeAll()
    }
    
    mutating func inputOperand(_ input: String) {
        guard input != CalculateError.dividedByZero.localizedDescription else {
            currentOperand = input
            return
        }
        
        let isPointDuplication: Bool = input == "." && currentOperand.contains(".")
        let isZeroDuplication: Bool = currentOperand == Calculator.defaultOperand && ["0", "00"].contains(input)
        if isZeroDuplication || isPointDuplication {
            return
        }
        if currentOperand == CalculateError.dividedByZero.localizedDescription {
            resetCurrentOperand()
        }
        
        let isInitialState: Bool = currentOperand == Calculator.defaultOperand && input != "."
        if isInitialState{
            currentOperand = input
        } else {
            currentOperand = applyFormat(to: "\(currentOperand)\(input)")
        }
    }
    
    mutating func inputOperator(_ input: String) {
        
    }
    
    mutating func switchPositiveNegativeOfCurrentOperand() {
        
    }
    
    mutating func result() -> String {
        return ""
    }
    
    private func applyFormat(to input: String) -> String {
        return ""
    }
}
