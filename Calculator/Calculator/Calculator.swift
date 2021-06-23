//
//  Calculator.swift
//  Calculator
//
//  Created by 신동훈 on 2021/06/23.
//

import Foundation

enum OperatorError: Error {
    case unknownOperator
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

class Calculator {
    func calculate(infix: [String]) throws -> String {
        var result: String = ""
        let postfix: [String] = try changeToPostfix(infix: infix)
        return result
    }

    func convertToOperator(string: String) throws -> Operator {
        switch string {
        case "+":
            return .plus
        case "-":
            return .minus
        case "×":
            return .multiply
        case "÷":
            return .divide
        default:
            throw OperatorError.unknownOperator
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
    
    func popAndAppend( sign: String, from temporarySignStack: inout Stack<String>, to postfix: inout [String]) throws {
        while let topOfTemporarySignStcak = temporarySignStack.top,
              try !hasHigherPriority(this: sign, than: topOfTemporarySignStcak) {
            if let poppedSign = temporarySignStack.pop() {
                postfix.append(poppedSign)
            }
        }
    }
}
