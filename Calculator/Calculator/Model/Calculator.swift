//
//  Calculator.swift
//  Calculator
//
//  Created by 박병호 on 2021/11/25.
//

import Foundation

struct Calculator: Calculatable {
    var formulaStack: [String] = []
    var currentOperand = ""
    var currentOperator = ""
    
    var currentOperandIsZero: Bool {
        return currentOperand.isZero
    }
    
    var currentOperandIsNotZero: Bool {
        return currentOperand.isNotZero
    }
    
    var historyStackIsNotEmpty: Bool {
        return !formulaStack.isEmpty
    }
    
    mutating func clearHistoryStack() {
        formulaStack.removeAll()
    }
    
    mutating func updateCurrentOperandValue(to newOperand: String) {
        currentOperand = newOperand
    }
    
    mutating func updateCurrentOperatorValue(to newOperator: String) {
        currentOperator = newOperator
    }
    
    mutating func updateHistoryStack(with currentOperator: String, and currentOperand: String) {
        formulaStack.append(contentsOf: [currentOperator, currentOperand])
    }
}
