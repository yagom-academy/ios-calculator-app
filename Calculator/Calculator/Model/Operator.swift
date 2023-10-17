//
//  Operator.swift
//  Calculator
//
//  Created by Kiseok on 2023/10/11.
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
        let decimalLhs = Decimal(lhs)
        let decimalRhs = Decimal(rhs)
        let result = decimalLhs + decimalRhs
        
        return Double(truncating: result as NSDecimalNumber)
    }
    
    private func subtract(lhs: Double, rhs: Double) -> Double {
        let decimalLhs = Decimal(lhs)
        let decimalRhs = Decimal(rhs)
        let result = decimalLhs - decimalRhs
        
        return Double(truncating: result as NSDecimalNumber)
    }
    
    private func divide(lhs: Double, rhs: Double) -> Double {
        if rhs == 0 {
            return .nan
        }
        
        let decimalLhs = Decimal(lhs)
        let decimalRhs = Decimal(rhs)
        let result = decimalLhs / decimalRhs
        
        return Double(truncating: result as NSDecimalNumber)
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        let decimalLhs = Decimal(lhs)
        let decimalRhs = Decimal(rhs)
        let result = decimalLhs * decimalRhs
        
        return Double(truncating: result as NSDecimalNumber)
    }
}
