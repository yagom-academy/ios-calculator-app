//
//  Operator.swift
//  Calculator
//
//  Created by 이경민 on 2022/09/22.
//

enum `Operator`: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "*"
    
    func calculate(lhs: Double, rhs: Double) throws -> Double {
        switch self {
        case .add: return add(lhs: lhs, rhs: rhs)
        case .subtract: return subtract(lhs: lhs, rhs: rhs)
        case .divide: return divide(lhs: lhs, rhs: rhs)
        case .multiply: return try multiply(lhs: lhs, rhs: rhs)
        }
    }
    
    private func add(lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }
    
    private func subtract(lhs: Double, rhs: Double) -> Double {
        return lhs - rhs
    }
    
    private func divide(lhs: Double, rhs: Double) -> Double {
        return lhs / rhs
    }
    
    private func multiply(lhs: Double, rhs: Double) throws -> Double {
        if rhs == 0 {
            throw OperatorError.divideZero
        }
        return lhs * rhs
    }
}
