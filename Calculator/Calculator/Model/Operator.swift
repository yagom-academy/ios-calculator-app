//
//  Operator.swift
//  Calculator
//
//  Created by Erick on 2023/05/29.
//  Last modify : idinaloq, Erick, Maxhyunm

import Foundation

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "−"
    case divide = "÷"
    case multiply = "×"
    
    func calculate(lhs: Double, rhs: Double) throws -> Double {
        switch self {
        case .add:
            return self.add(lhs: lhs, rhs: rhs)
        case .subtract:
            return self.subtract(lhs: lhs, rhs: rhs)
        case .divide:
            return self.divide(lhs: lhs, rhs: rhs)
        case .multiply:
            return self.multiply(lhs: lhs, rhs: rhs)
        }
    }
    
    private func add(lhs: Double, rhs: Double) -> Double {
        let result = NSDecimalNumber(decimal: Decimal(lhs) + Decimal(rhs))
        return result.doubleValue
    }
    
    private func subtract(lhs: Double, rhs: Double) -> Double {
        let result = NSDecimalNumber(decimal: Decimal(lhs) - Decimal(rhs))
        return  result.doubleValue
    }
    
    private func divide(lhs: Double, rhs: Double) -> Double {
        guard rhs != Double.zero else {
            return Double.nan
        }
        let result = NSDecimalNumber(decimal: Decimal(lhs) / Decimal(rhs))
        return result.doubleValue
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        let result = NSDecimalNumber(decimal: Decimal(lhs) * Decimal(rhs))
        return result.doubleValue
    }
}
