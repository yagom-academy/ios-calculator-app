//
//  Operator.swift
//  Calculator
//
//  Created by Derrick kim on 2022/05/18.
//

import Foundation


enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "−"
    case multiply = "×"
    case divide = "÷"
}

extension Operator {
    func calculate(lhs: Double, rhs: Double) -> Double {
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
}

private extension Operator {
    func add(_ lhs: Double, _ rhs: Double) -> Double {
        return lhs + rhs
    }
    
    func subtract(_ lhs: Double, _ rhs: Double) -> Double {
        return lhs - rhs
    }
    
    func divide(_ lhs: Double, _ rhs: Double) -> Double {
        return rhs == .zero ? .nan : lhs / rhs
    }
    
    func multiply(_ lhs: Double, _ rhs: Double) -> Double {
        return lhs * rhs
    }
}
