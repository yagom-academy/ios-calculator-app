//
//  OperatorItem.swift
//  Calculator
//
//  Created by 재재, Kay on 2022/05/18.
//

import Foundation

enum OperatorItem: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "-"
    case multiply = "*"
    case divide = "/"
    
    func calculate(lhs: Double, rhs: Double) throws -> Double {
        switch self {
        case .add:
            return add(lhs: lhs, rhs: rhs)
        case .subtract:
            return subtract(lhs: lhs, rhs: rhs)
        case .multiply:
            return multiply(lhs: lhs, rhs: rhs)
        case .divide:
            return try divide(lhs: lhs, rhs: rhs)
        }
    }
    
    private func add(lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }
    private func subtract(lhs: Double, rhs: Double) -> Double {
        return lhs - rhs
    }
    private func multiply(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
    private func divide(lhs: Double, rhs: Double) throws -> Double {
        if rhs == 0.0 {
            throw valueError.divideByZero
        }
        return lhs / rhs
    }
}
