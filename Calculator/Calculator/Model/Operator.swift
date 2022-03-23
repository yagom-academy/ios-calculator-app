//
//  Operator.swift
//  Calculator
//
//  Created by mmim.
//

import Foundation

enum Operator: Character, CaseIterable, CalculatorItem {
    case add = "+"
    case subtract = "-"
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
        let lhsDecimal = Decimal(lhs)
        let rhsDecimal = Decimal(rhs)
        let result = lhsDecimal + rhsDecimal
        return Double(truncating: result as NSNumber)
    }
    
    private func subtract(lhs: Double, rhs: Double) -> Double {
        let lhsDecimal = Decimal(lhs)
        let rhsDecimal = Decimal(rhs)
        let result = lhsDecimal - rhsDecimal
        return Double(truncating: result as NSNumber)
    }
    
    private func divide(lhs: Double, rhs: Double) -> Double {
        if rhs == 0 {
            return .nan
        }
        let lhsDecimal = Decimal(lhs)
        let rhsDecimal = Decimal(rhs)
        let result = lhsDecimal / rhsDecimal
        return Double(truncating: result as NSNumber)
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        let lhsDecimal = Decimal(lhs)
        let rhsDecimal = Decimal(rhs)
        let result = lhsDecimal * rhsDecimal
        return Double(truncating: result as NSNumber)
    }
}
