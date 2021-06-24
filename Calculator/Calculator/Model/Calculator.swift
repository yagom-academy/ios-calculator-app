//
//  Calculator.swift
//  Calculator
//
//  Created by 김태영 on 2021/06/22.
//

import Foundation

extension Double {
    func toString() -> String {
        return String(format: "%f", self)
    }
}

struct Calculator {
    
    enum Operations: String {
        case plus = "+"
        case minus = "-"
        case multiply = "×"
        case divide = "÷"
        
        var description: String {
            return self.rawValue
        }
    }
    
    var expressionEntry = [String]()
    
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
    
    func isOperator(item: String) -> Bool {
        switch item {
        case "+", "-", "×", "÷":
            return true
        default:
            return false
        }
    }
    
    private func isNewEntryProceed(stackTop op1: Operations, newEntry op2: Operations) -> Bool {
        switch op1 {
        case .multiply, .divide:
            return false
        case .plus, .minus:
            return (op2 == .multiply || op2 == .divide) ? true : false
        }
    }
    
    func convertExpressionToPostfix() -> [String] {
        var result = [String]()
        var operationStack = Stack<Operations>()
        
        for item in expressionEntry {
            if isOperator(item: item) {
                guard let newOperation = Operations.init(rawValue: item) else { return [] }
                while true {
                    guard let stackTop = operationStack.top else {
                        operationStack.push(item: newOperation)
                        break
                    }
                    if isNewEntryProceed(stackTop: stackTop, newEntry: newOperation) {
                        operationStack.push(item: newOperation)
                        break
                    } else {
                        result.append(stackTop.description)
                        operationStack.pop()
                    }
                }
            } else {
                result.append(item)
            }
        }
        while !operationStack.isEmpty {
            guard let operation = operationStack.pop() else { break }
            result.append(operation.description)
        }
        print(result)
        return result
    }
    
    func calculate(input: [String]) -> String {
        var calculationStack = Stack<Double>()
        var entry = input
        
        while !entry.isEmpty {
            let firstValue = entry.removeFirst()
            if isOperator(item: firstValue) {
                guard let secondOperand = calculationStack.pop() else { return "1" }
                guard let firstOperand = calculationStack.pop() else { return "2" }
                let outCome = performOperation(firstOperand: firstOperand, secondOperand: secondOperand, operation: firstValue)
                
                calculationStack.push(item: outCome)
            } else {
                guard let operand = Double(firstValue) else { return "3" }
                
                calculationStack.push(item: operand)
            }
        }
        guard let finalResult = calculationStack.pop() else { return "444" }
        return finalResult.toString()
    }
    
    func performOperation(firstOperand: Double, secondOperand: Double, operation: String) -> Double {
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
}
