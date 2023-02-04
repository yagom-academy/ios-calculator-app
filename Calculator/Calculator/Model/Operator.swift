//
//  Operator.swift
//  Calculator
//
//  Created by Rowan on 2023/01/27.
//

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
        let result = lhs + rhs
        
        return result
    }
    
    private func subtract(lhs: Double, rhs: Double) -> Double {
        let result = lhs - rhs
        
        return result
    }
    
    private func divide(lhs: Double, rhs: Double) -> Double {
        if rhs == Double.zero {
            return .nan
        }
        
        let result = lhs / rhs
        
        return result
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        let result = lhs * rhs
        
        return result
    }
}
