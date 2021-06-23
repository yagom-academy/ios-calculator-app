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
        case "+", "-", "x", "÷":
            return true
        default:
            return false
        }
    }
    
    private func isNewEntryProceed(stackTop op1: String,newEntry op2: String) -> Bool {
        switch op1 {
        case "x", "÷":
            return (op2 == "x" || op2 == "÷") ? true : false
        case "+", "-":
            return true

        default:
            return true
        }
    }
    
    func convertExpressionToPostfix() -> [String] {
        var result = [String]()
        var operationStack = Stack<String>()
        
        for item in expressionEntry {
            if isOperator(item: item) {
                while true {
                    guard let stackTop = operationStack.top else {
                        operationStack.push(item: item)
                        break
                    }
                    if isNewEntryProceed(stackTop: stackTop, newEntry: item) {
                        operationStack.push(item: item)
                        break
                    } else {
                        result.append(stackTop)
                        operationStack.pop()
                    }
                }
            } else {
                result.append(item)
            }
        }
        while !operationStack.isEmpty {
            guard let operation = operationStack.pop() else { break }
            result.append(operation)
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
                guard let secondOperand = calculationStack.pop() else {return "1"}
                guard let firstOperand = calculationStack.pop() else {return "2"}
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
        case "x":
            return firstOperand * secondOperand
        case "÷":
            return firstOperand / secondOperand
        
        default:
            return 0.0
        }
    }
}
