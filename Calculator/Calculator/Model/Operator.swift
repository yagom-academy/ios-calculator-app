//
//  Operator.swift
//  Calculator
//
//  Created by 송종환 on 2023/01/26.
//

import Foundation

enum Operator: Character, CaseIterable {
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
    
    private func add(lhs: Double, rhs: Double) -> Double {
       return lhs + rhs
    }
    
    private func subtract(lhs: Double, rhs: Double) -> Double {
       return lhs - rhs
    }
    
    private func divide(lhs: Double, rhs: Double) throws -> Double {
        if rhs == 0 {
            throw CalculateError.divideError
        }
       return lhs / rhs
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
       return lhs * rhs
    }
}
