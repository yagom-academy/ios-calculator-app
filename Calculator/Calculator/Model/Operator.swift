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
        let lhsToDecimal: Decimal = Decimal(lhs)
        let rhsToDecimal: Decimal = Decimal(rhs)
        let result = (lhsToDecimal + rhsToDecimal).description
        return Double(result) ?? .nan
    }
    
    private func subtract(lhs: Double, rhs: Double) -> Double {
        let lhsToDecimal: Decimal = Decimal(lhs)
        let rhsToDecimal: Decimal = Decimal(rhs)
        let result = (lhsToDecimal - rhsToDecimal).description
        return Double(result) ?? .nan
    }
    
    private func divide(lhs: Double, rhs: Double) -> Double {
        if rhs == 0 {
            return .nan
        }
        let lhsToDecimal: Decimal = Decimal(lhs)
        let rhsToDecimal: Decimal = Decimal(rhs)
        let result = (lhsToDecimal / rhsToDecimal).description
        return Double(result) ?? .nan
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        let lhsToDecimal: Decimal = Decimal(lhs)
        let rhsToDecimal: Decimal = Decimal(rhs)
        let result = (lhsToDecimal * rhsToDecimal).description
        return Double(result) ?? .nan
    }
}
