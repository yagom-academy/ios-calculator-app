//
//  Operator.swift
//  Calculator
//
//  Created by SeoDongyeon on 2022/03/17.
//

import Foundation

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "*"
    
    func calculate(lhs: Double, rhs: Double) throws -> Double {
        switch self {
        case .add:
            return add(lhs, rhs)
        case .subtract:
            return subtract(lhs, rhs)
        case .divide:
            return try divide(lhs, rhs)
        case .multiply:
            return multiply(lhs, rhs)
        }
    }

    private func add(_ lhs: Double, _ rhs: Double) -> Double {
        return lhs + rhs
    }
    
    private func subtract(_ lhs: Double, _ rhs: Double) -> Double {
        return lhs - rhs
    }
    
    private func divide(_ lhs: Double, _ rhs: Double) throws -> Double {
        if rhs == 0 {
            throw DivideError.divideByZero
        }
        return lhs / rhs
    }
    
    private func multiply(_ lhs: Double, _ rhs: Double) -> Double {
        return lhs * rhs
    }
}
