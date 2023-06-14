//
//  Operator.swift
//  Calculator
//
//  Created by mint, Whales on 2023/06/02.
//

import Foundation

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "−"
    case divide = "÷"
    case multiply = "×"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .add:
            return add(lhs: lhs, rhs: rhs)
        case .subtract:
            return subtract(lhs: lhs, rhs: rhs)
        case .divide:
            return divide(lhs: lhs, rhs: rhs)
        case .multiply:
            return multiply(lhs: lhs, rhs: rhs)
        }
    }
    
    private func add(lhs: Double, rhs: Double) -> Double {
        return NSDecimalNumber(decimal: Decimal(lhs) + Decimal(rhs)).doubleValue
    }
    
    private func subtract(lhs: Double, rhs: Double) -> Double {
        return NSDecimalNumber(decimal: Decimal(lhs) - Decimal(rhs)).doubleValue
    }
    
    private func divide(lhs: Double, rhs: Double) -> Double {
        guard rhs != 0 else {
            return .nan
        }
        return NSDecimalNumber(decimal: Decimal(lhs) / Decimal(rhs)).doubleValue
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        return NSDecimalNumber(decimal: Decimal(lhs) * Decimal(rhs)).doubleValue
    }
}
