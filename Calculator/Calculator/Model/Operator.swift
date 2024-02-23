//
//  Operator.swift
//  Calculator
//
//  Created by Prism, Hamzzi CHOI on 2/16/24.
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
            return try divide(lhs: lhs, rhs: rhs)
        case .multiply:
            return multiply(lhs: lhs, rhs: rhs)
        }
    }
    
    func add(lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }
    
    func subtract(lhs: Double, rhs: Double) -> Double {
        return lhs - rhs
    }
    
    func divide(lhs: Double, rhs: Double) throws -> Double {
        guard rhs != 0 else {
            throw CalculateError.divisionByZero
        }
        
        return lhs / rhs
    }
    
    func multiply(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
}
