//
//  Operator.swift
//  Calculator
//
//  Created by Hyungmin Lee on 2023/06/02.
//

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "−"
    case divide = "÷"
    case multiply = "×"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        let result: Double
        
        switch self {
        case .add:
            result = add(lhs, rhs)
        case .subtract:
            result = subtract(lhs, rhs)
        case .divide:
            result = divide(lhs, rhs)
        case .multiply:
            result = multiply(lhs, rhs)
        }
        
        return result
    }
    
    private func add(_ lhs: Double, _ rhs: Double) -> Double {
        return lhs + rhs
    }
    
    private func subtract(_ lhs: Double, _ rhs: Double) -> Double {
        return lhs - rhs
    }
    
    private func divide(_ lhs: Double, _ rhs: Double) -> Double {
        let result = lhs / rhs
        
        return result.isInfinite ? .nan : result
    }
    
    private func multiply(_ lhs: Double, _ rhs: Double) -> Double {
        return lhs * rhs
    }
}
