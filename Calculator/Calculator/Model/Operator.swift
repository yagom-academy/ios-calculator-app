//
//  Operators.swift
//  Calculator
//
//  Created by marisol on 2022/03/15.
//

import Foundation

enum Operator: Character, CaseIterable, CalculateItem {
    case addition = "+"
    case subtraction = "-"
    case division = "÷"
    case multiplication = "×"
}
extension Operator {
    public func calculate(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .addition:
            return add(lhs: lhs, rhs: rhs)
        case .subtraction:
            return subtract(lhs: lhs, rhs: rhs)
        case .division:
            return divide(lhs: lhs, rhs: rhs)
        case .multiplication:
            return multiply(lhs: lhs, rhs: rhs)
        }
    }
    
    private func add(lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }
    
    private func subtract(lhs: Double, rhs: Double) -> Double {
        return lhs - rhs
    }
    
    private func divide(lhs: Double, rhs: Double) -> Double {
        return lhs / rhs
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
}
