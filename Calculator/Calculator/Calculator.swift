//
//  Calculator.swift
//  Calculator
//
//  Created by 신동훈 on 2021/06/23.
//

import Foundation

enum CalculatorError: Error {
    case unknownOperator
    case divisionByZero(description: String)
    case invalidEquation
    case vacantEquation
    case unknownError
}

enum Operator {
    private static let lowPriority = 1
    private static let highPriority = 2

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
        let postfix: [String] = try changeToPostfixNotation(infix: infix)
        let operationResult = try calculatePostfix(postfix: postfix)
        let finalResult: String = try format(number: operationResult)
        return finalResult
    }
    
    private func format(number: Double) throws -> String {
        let formatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            return formatter
        }()
        guard let result = formatter.string(from: NSNumber(value: number)) else {
            throw CalculatorError.unknownError
        }
        return result
    }

    private func calculatePostfix(postfix: [String]) throws -> Double {
        var temporaryNumberStack = Stack<Double>()
        for element in postfix {
            if let number = Double(element) {
                temporaryNumberStack.push(number)
            } else {
                try calculateToValue(operator: element, tempNumberStack: &temporaryNumberStack)
            }
        }
        guard let result = temporaryNumberStack.pop() else {
            throw CalculatorError.vacantEquation
        }
        return result
    }
    private func calculateToValue(operator: String, tempNumberStack: inout Stack<Double>) throws {
        guard let firstOperand = tempNumberStack.pop(),
              let secondOperand = tempNumberStack.pop()
        else {
            return
        }
        try checkDivisionError(operator: `operator`, secondOperand: secondOperand)
        let equation = String(firstOperand) + `operator` + String(secondOperand)
        let operationResult = try solve(equation: equation)
        tempNumberStack.push(operationResult)
    }

    private func checkDivisionError(operator: String, secondOperand: Double) throws {
        if `operator` == "/" && secondOperand == 0.0 {
            throw CalculatorError.divisionByZero(description: "NaN")
        }
    }

    func solve(equation: String) throws -> Double {
        let expression = NSExpression(format: equation)
        guard let operationResult = expression.expressionValue(
                with: nil, context: nil
        ) as? Double else {
            throw CalculatorError.invalidEquation
        }
        return operationResult
    }

    private func convertToOperator(string: String) throws -> Operator {
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

    private func changeToPostfixNotation(infix: [String]) throws -> [String] {
        var temporarySignStack = Stack<String>()
        var postfix: [String] = []
        for element in infix {
            if Double(element) != nil {
                postfix.append(element)
            } else {
                try popAndAppend(sign: element, from: &temporarySignStack, to: &postfix)
                temporarySignStack.push(element)
            }
        }
        try popAndAppendLeftovers(from: &temporarySignStack, to: &postfix)
        return postfix
    }

    private func hasHigherPriority(this: String, than: String) throws -> Bool {
        let currentOperator: Operator = try convertToOperator(string: this)
        let thanOperator: Operator = try convertToOperator(string: than)
        return currentOperator > thanOperator
    }
    
    private func popAndAppend(sign: String,
                              from temporarySignStack: inout Stack<String>,
                              to postfix: inout [String]) throws {
        while let topOfTemporarySignStack = temporarySignStack.top,
              try hasHigherPriority(this: sign, than: topOfTemporarySignStack) == false {
            if let poppedSign = temporarySignStack.pop() {
                postfix.append(poppedSign)
            }
        }
    }

    private func popAndAppendLeftovers(from temporarySignStack: inout Stack<String>,
                                       to postfix: inout [String]) throws{
        while temporarySignStack.isEmpty == false {
            if let poppedSign = temporarySignStack.pop() {
                postfix.append(poppedSign)
            }
        }
    }
}
