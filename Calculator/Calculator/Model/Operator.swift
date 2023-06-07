//
//  Operator.swift
//  Calculator
//
//  Created by kangkyungmin on 2023/06/07.
//
import Foundation

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "−"
    case divide = "÷"
    case multiply = "×"

    func calculate(lhs: Double, rhs: Double) throws -> Double {
        switch self {
        case .add:
            return add(lhs: lhs, rhs: rhs)
        case .subtract:
            return subtract(lhs: lhs, rhs: rhs)
        case .divide:
            if rhs == 0 {
                throw OperationError.divideByZeroError
            }
            
            return divide(lhs: lhs, rhs: rhs)
        case .multiply:
            return multiply(lhs: lhs, rhs: rhs)
        }
    }
    
    private func add(lhs: Double, rhs: Double) -> Double {
        return NSDecimalNumber(decimal: (Decimal(lhs) + Decimal(rhs))).doubleValue
    }
    
    private func subtract(lhs: Double, rhs: Double) -> Double {
        return NSDecimalNumber(decimal: (Decimal(lhs) - Decimal(rhs))).doubleValue
    }
    
    private func divide(lhs: Double, rhs: Double) -> Double {
        return NSDecimalNumber(decimal: (Decimal(lhs) / Decimal(rhs))).doubleValue
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        return NSDecimalNumber(decimal: (Decimal(lhs) * Decimal(rhs))).doubleValue
    }
}
