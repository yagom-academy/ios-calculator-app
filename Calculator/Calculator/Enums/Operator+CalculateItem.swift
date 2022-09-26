//
//  Operator.swift
//  Calculator
//
//  Created by 노유빈 on 2022/09/21.
//

enum Operator: Character, CaseIterable {
    case add = "+"
    case subtract = "-"
    case divide = "÷"
    case multiply = "×"
    
    func calculate(_ lhs: Double, _ rhs: Double) -> Double {
        switch self {
        case .add:
            return add(lhs, rhs)
        case .subtract:
            return subtract(lhs, rhs)
        case .divide:
            return divide(lhs, rhs)
        case .multiply:
            return multiply(lhs, rhs)
        }
    }
    
    private func add(_ lhs: Double, _ rhs: Double) -> Double {
        return lhs + rhs
    }
    
    private func subtract(_ lhs: Double, _ rhs: Double) -> Double {
        return lhs - rhs
    }
    
    private func divide(_ lhs: Double, _ rhs: Double) -> Double {
        return lhs / rhs
    }
    
    private func multiply(_ lhs: Double, _ rhs: Double) -> Double {
        return lhs * rhs
    }
}

extension Operator: CalculateItem { }
