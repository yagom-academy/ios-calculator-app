//
//  Calculator.swift
//  Calculator
//
//  Created by 신동훈 on 2021/06/23.
//

import Foundation

enum CalculatorError: Error {
    case unknownOperator
    case divideByZero(description: String)
    case invalidEquation
}

enum Operator {
    static let lowPriority = 1
    static let highPriority = 2
    
    case plus, minus
    case multiply, divide

    var priority: Int {
        switch self {
        case .plus, .minus:
            return Operator.lowPriority
        case .multiply, .divide:
            return Operator.highPriority
        }
    }

    static func >(lhs: Operator, rhs: Operator) -> Bool {
        return lhs.priority > rhs.priority
    }
}

struct Calculator {
    func calculate(infix: [String]) throws -> String {
        var result: String = ""
        let postfix: [String] = try changeToPostfix(infix: infix)
        let operationResult = try calculatePostfix(postfix: postfix)
        print(operationResult)
        return result
    }

    func calculatePostfix(postfix: [String]) throws {
        var temporaryNumberStack = Stack<String>()
        for element in postfix {
            if let _ = Double(element) {
                temporaryNumberStack.push(element)
            } else {
                try calculateToValue(operator: element,
                                     tempNumberStack: &temporaryNumberStack
                )
            }
        }
        print(temporaryNumberStack.pop()!)
    }
    
    func calculateToValue(operator: String,
                          tempNumberStack: inout Stack<String>
    ) throws {
        guard let firstOperand = tempNumberStack.pop(),
              let secondOperand = tempNumberStack.pop()
        else {
            return
        }
        try checkDivisionError(operator: `operator`, secondOperand: secondOperand)
        let equation = firstOperand + `operator` + secondOperand
        let operationResult = try solve(equation: equation)
        tempNumberStack.push(operationResult)
    }
    
    func checkDivisionError(operator: String, secondOperand: String) throws {
        if `operator` == "/" && secondOperand == "0" {
            throw CalculatorError.divideByZero(description: "NaN")
        }
    }
    
    func solve(equation: String) throws -> String {
        let expression = NSExpression(format: equation)
        guard let operationResult = expression.expressionValue(
                with: nil, context: nil
        ) as? Double else {
            throw CalculatorError.invalidEquation
        }
        return String(operationResult)
    }

    func convertToOperator(string: String) throws -> Operator {
        switch string {
        case "+":
            return .plus
        case "-":
            return .minus
        case "*":
            return .multiply
        case "/":
            return .divide
        default:
            throw CalculatorError.unknownOperator
        }
    }
    
    func changeToPostfix(infix: [String]) throws -> [String] {
        var temporarySignStack = Stack<String>()
        var postfix: [String] = []
        for element in infix {
            if let _ = Double(element) {
                postfix.append(element)
            } else {
                try popAndAppend(sign: element, from: &temporarySignStack, to: &postfix)
                temporarySignStack.push(element)
            }
        }

        while !temporarySignStack.isEmpty {
            let poppedSign = temporarySignStack.pop()
            postfix.append(poppedSign!)
        }
        return postfix
    }

    func hasHigherPriority(this: String, than: String) throws -> Bool {
        let currentOperator: Operator = try convertToOperator(string: this)
        let thanOperator: Operator = try convertToOperator(string: than)
        return currentOperator > thanOperator
    }
    
    func popAndAppend(sign: String, from temporarySignStack: inout Stack<String>, to postfix: inout [String]) throws {
        while let topOfTemporarySignStcak = temporarySignStack.top,
              try !hasHigherPriority(this: sign, than: topOfTemporarySignStcak) {
            if let poppedSign = temporarySignStack.pop() {
                postfix.append(poppedSign)
            }
        }
    }
}
