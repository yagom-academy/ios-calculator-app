//
//  Operator.swift
//  Calculator
//
//  Created by 김인호 on 2022/09/22.
//

import Foundation

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "-"
    case divide = "%"
    case multiply = "*"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        let result: Double
        switch self {
        case .add:
            result = add(lhs: lhs, rhs: rhs)
        case .subtract:
            result = subtract(lhs: lhs, rhs: rhs)
        case .divide:
            result = divide(lhs: lhs, rhs: rhs)
        case .multiply:
            result = multiply(lhs: lhs, rhs: rhs)
        }
        return result
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
        let result = lhs / rhs
        return result
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        let result = lhs * rhs
        return result
    }
}
