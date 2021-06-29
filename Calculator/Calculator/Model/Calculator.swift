//  Calculator.swift
//  Calculator
//
//  Created by 요시킴
//

import Foundation

extension Formatter {
    static let number = NumberFormatter()
}

extension Double {
    func fractionDigits(min: Int = 0, max: Int = 20) -> String {
        Formatter.number.minimumFractionDigits = min
        Formatter.number.maximumFractionDigits = max
        return Formatter.number.string(for: self) ?? "NaN"
    }
}

enum CalculatorError: Error {
    case FailToPopFromCalculationStack
    case FailToTypeCasting
    case FailToOperandTypeCasting
    case InValidInput
    case DivideByZero
}

struct Calculator {
    private enum Operations: String, CustomStringConvertible {
        case plus = "+"
        case minus = "-"
        case multiply = "×"
        case divide = "÷"
        
        var description: String {
            switch self {
            case .plus:
                return "+"
            case .minus:
                return "-"
            case .multiply:
                return "×"
            case .divide:
                return "÷"
            }
        }
    }
    
    private var expressionEntry = [String]()
    
    mutating func enterExpression(operation: String, inputNumber: String) {
        guard operation != "=" else { return }
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
    
    private func convertExpressionToPostfix() throws -> [String] {
        var result = [String]()
        var operationStack = Stack<Operations>()
        
        for item in expressionEntry {
            if isOperator(item: item) {
                guard let newOperation = Operations.init(rawValue: item) else { throw CalculatorError.FailToTypeCasting }
                while true {
                    guard let stackTop = operationStack.peek() else {
                        operationStack.push(item: newOperation)
                        break
                    }
                    if isNewOperatorProceed(stackTop: stackTop, newEntry: newOperation) {
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
    
    func calculate() throws -> String {
        var entry = try convertExpressionToPostfix()
        var calculationStack = Stack<Double>()
        
        while !entry.isEmpty {
            let firstValue = entry.removeFirst()
            if isOperator(item: firstValue) {
                guard let secondOperand = calculationStack.pop(), let firstOperand = calculationStack.pop() else { throw CalculatorError.FailToPopFromCalculationStack }
                if secondOperand == 0 && firstValue == "÷" { return "NaN" }
                let outCome = performOperation(firstOperand: firstOperand, secondOperand: secondOperand, operation: firstValue)
                calculationStack.push(item: outCome)
            } else {
                guard let operand = Double(firstValue) else { throw CalculatorError.FailToOperandTypeCasting }
                calculationStack.push(item: operand)
            }
        }
        guard let finalResult = calculationStack.pop() else { throw CalculatorError.FailToPopFromCalculationStack }
        return finalResult.fractionDigits()
    }
}
