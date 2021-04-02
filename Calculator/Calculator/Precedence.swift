//
//  Precedence.swift
//  Calculator
//
//  Created by 김민성 on 2021/03/30.
//

import Foundation

enum Precedence {
    case bitwisePrecedence
    case multiplicationPrecedence
    case additionPrecedence
}

extension Precedence: Comparable {
    static func < (lhs: Precedence, rhs: Precedence) -> Bool {
        switch (lhs, rhs) {
        case (.bitwisePrecedence, .multiplicationPrecedence), (.bitwisePrecedence, .additionPrecedence), (.multiplicationPrecedence, .additionPrecedence):
            return false
        default:
            return true
        }
    }

    static func == (lhs: Precedence, rhs: Precedence) -> Bool {
        switch (lhs, rhs) {
        case (.bitwisePrecedence, .bitwisePrecedence), (.multiplicationPrecedence, .multiplicationPrecedence), (.additionPrecedence, .additionPrecedence):
            return true
        default:
            return false
        }
    }
}

enum Operators: String, CaseIterable {
    case multiplication = "*"
    case division = "/"
    case addition = "+"
    case subtraction = "-"
    case leftShift = "<<"
    case rightShift = ">>"
    case AND = "&"
    case NAND = "~&"
    case OR = "|"
    case NOR = "~|"
    case XOR = "^"
    case NOT = "~"
    
    var precedence: Precedence {
        switch self {
        case .leftShift, .rightShift, .NOT:
            return .bitwisePrecedence
        case .AND, .NAND, .multiplication, .division:
            return .multiplicationPrecedence
        case .addition, .subtraction, .OR, .NOR, .XOR:
            return .additionPrecedence
        }
    }
    
    static var list: [String] {
        return Operators.allCases.map { $0.rawValue }
    }
}
