//
//  InfixOperator.swift
//  Calculator
//
//  Created by 덕복 on 2021/03/30.
//

protocol InfixOperator: CalculatingElement, CaseIterable {
    var precedence: Int { get }
    
    init?(rawValue: String)
}

extension InfixOperator {
    func isPrecedence(over anotherOperator: Self) -> Bool {
        return self.precedence > anotherOperator.precedence
    }
}

enum DecimalInfixOperator: String, InfixOperator {
    case multifly = "*", divide = "/"
    case add = "+", subtract = "-"
    
    var precedence: Int {
        switch self {
        case .multifly, .divide:
            return 2
        case .add, .subtract:
            return 1
        }
    }
}

enum BinaryInfixOpeartor: String, InfixOperator {
    case bitwiseLeftShift = "<<", bitwiseRightShift = ">>"
    case bitwiseAND = "&", bitwiseNAND = "~&"
    case add = "+", subtract = "-", bitwiseOR = "|", bitwiseNOR = "~|", bitwiseXOR = "^"
    
    var precedence: Int {
        switch self {
        case .bitwiseLeftShift, .bitwiseRightShift:
            return 3
        case .bitwiseAND, .bitwiseNAND:
            return 2
        case .add, .subtract, .bitwiseOR, .bitwiseNOR, .bitwiseXOR:
            return 1
        }
    }
}
