//
//  Operator.swift
//  Calculator
//
//  Created by 서현웅 on 2022/09/22.
//

import Foundation

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "*"
    
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
    
    func add(lhs: Double, rhs: Double) -> Double {
        let result = lhs + rhs
        return result
    }
    
    func subtract(lhs: Double, rhs: Double) -> Double {
        let result = lhs - rhs
        return result
    }
    
    func divide(lhs: Double, rhs: Double) -> Double {
        let result = lhs / rhs
        return result
    }
    
    func multiply(lhs: Double, rhs: Double) -> Double {
        let result = lhs * rhs
        return result
    }
}
