//  Calculator.swift
//  Calculator
//
//  Created by 요시킴
//

import Foundation

struct Calculator {
    
    private enum Operations: String {
        case plus = "+"
        case minus = "-"
        case multiply = "×"
        case divide = "÷"
        
        var description: String {
            return self.rawValue
        }
    }
    
    private var expressionEntry = [String]()
    
    mutating func enterExpression(operation: String, inputNumber: String) {
        if expressionEntry.isEmpty {
            expressionEntry.append(inputNumber)
        } else {
            expressionEntry.append(operation)
            expressionEntry.append(inputNumber)
        }
        print(expressionEntry)
    }
    
    mutating func allClear() {
        expressionEntry.removeAll()
    }
    
    private func isOperator(item: String) -> Bool {
        switch item {
        case "+", "-", "×", "÷":
            return true
        default:
            return false
        }
    }
    
    private func performOperation(firstOperand: Double, secondOperand: Double, operation: String) -> Double {
        switch operation {
        case "+":
            return firstOperand + secondOperand
        case "-":
            return firstOperand - secondOperand
        case "×":
            return firstOperand * secondOperand
        case "÷":
            return firstOperand / secondOperand
        default:
            return 0.0
        }
    }
    
    private func isNewOperatorProceed(stackTop op1: Operations, newEntry op2: Operations) -> Bool {
        switch op1 {
        case .multiply, .divide:
            return false
        case .plus, .minus:
            return (op2 == .multiply || op2 == .divide) ? true : false
        }
    }
    
}

