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
            return add(lhs, by: rhs)
        case .subtract:
            return subtract(lhs, by: rhs)
        case .divide:
            return try divide(lhs, by: rhs)
        case .multiply:
            return multiply(lhs, by: rhs)
        }
    }

    private func add(_ lhs: Double, by rhs: Double) -> Double {
        return lhs + rhs
    }
    
    private func subtract(_ lhs: Double, by rhs: Double) -> Double {
        return lhs - rhs
    }
    
    private func divide(_ lhs: Double, by rhs: Double) throws -> Double {
        if rhs == 0 {
            throw DivideError.divideByZero
        }
        return lhs / rhs
    }
    
    private func multiply(_ lhs: Double, by rhs: Double) -> Double {
        return lhs * rhs
    }
}
