//
//  Operator.swift
//  Calculator
//
//  Created by mene on 22/9/2022.
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
    
    private func add(lhs: Double, rhs: Double) -> Double { lhs + rhs }
    
    private func subtract(lhs: Double, rhs: Double) -> Double { lhs - rhs }
    
    private func divide(lhs: Double, rhs: Double) -> Double {
        
        let result = lhs / rhs
        
        if result == Double.infinity {
            return 0
        } else {
            return result
        }
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double { lhs * rhs }
}

