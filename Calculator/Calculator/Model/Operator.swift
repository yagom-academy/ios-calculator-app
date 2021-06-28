//
//  Operator.swift
//  Calculator
//
//  Created by Kim Do hyung on 2021/06/22.
//

import Foundation

enum Operator: String {
    case plus = "+"
    case minus = "-"
    case divide = "/"
    case multiply = "*"
    
    func getPriority() -> Int {
        switch self {
        case .plus: return 1
        case .minus: return 1
        case .multiply: return 10
        case .divide: return 10
        }
    }
    
    func isLowerPriority(than operatorCase: Operator) -> Bool {
        return operatorCase.getPriority() >= self.getPriority()
    }
    
    func calculate(_ lhs: Operand, with rhs: Operand) throws -> Double {
        switch self {
        case .plus:
            return lhs.plus(with: rhs)
        case .minus:
            return lhs.minus(with: rhs)
        case .multiply:
            return lhs.multiple(with: rhs)
        case .divide:
            return try lhs.divide(by: rhs)
        }
    }
}
