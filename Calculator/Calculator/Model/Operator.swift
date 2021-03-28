//
//  Operator.swift
//  Calculator
//
//  Created by 덕복 on 2021/03/25.
//

import Foundation

protocol Operator: CalculatingElement { }

enum InfixOperator: String, Operator, CaseIterable {
    case bitwiseLeftShift = "<<", bitwiseRightShift = ">>"
    case multifly = "*", divide = "/", bitwiseAND = "&", bitwiseNAND = "~&"
    case add = "+", subtract = "-", bitwiseOR = "|", bitwiseNOR = "~|", bitwiseXOR = "^"
    
    var precedence: Int {
        switch self {
        case .bitwiseLeftShift, .bitwiseRightShift:
            return 3
        case .multifly, .divide, .bitwiseAND, .bitwiseNAND:
            return 2
        case .add, .subtract, .bitwiseOR, .bitwiseNOR, .bitwiseXOR:
            return 1
        }
    }
    
    func isPrecedence(over anotherOperator: InfixOperator) -> Bool {
        return false == (self.precedence < anotherOperator.precedence)
    }
}

enum PrefixOperator: String, Operator, CaseIterable {
    case bitwiseNOT = "~"
    case unaryMinus = "-"
}
