//
//  Calculator.swift
//  Calculator
//
//  Created by junho lee on 2022/10/03.
//

struct Calculator {
    private(set) var currentOperator: String = ""
    private(set) var currentOperand: String = "0"
    private var operators: [String] = []
    private var operands: [String] = []
    
    mutating func resetCurrentOperand() {
        currentOperand = "0"
    }
    
    mutating func resetCurrentOperator() {
        currentOperator = ""
    }
    
    mutating func clearOperands() {
        operands.removeAll()
    }
    
    mutating func clearOperators() {
        operators.removeAll()
    }
    
    mutating func inputOperand(_ input: String) {
        
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
