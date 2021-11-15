//
//  Operator.swift
//  Calculator
//
//  Created by Eunsoo KIM on 2021/11/12.
//

import Foundation

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case substract = "-"
    case divide = "/"
    case multiply = "*"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .add:
            return add(lhs: lhs, rhs: rhs)
        case .substract:
            return substract(lhs: lhs, rhs: rhs)
        case .divide:
            return divide(lhs: lhs, rhs: rhs)
        case .multiply:
            return multiply(lhs: lhs, rhs: rhs)
        }
    }
    
    private func add(lhs: Double, rhs: Double) -> Double {
        lhs + rhs
    }
    
    private func substract(lhs: Double, rhs: Double) -> Double {
        lhs - rhs
    }
    
    private func divide(lhs: Double, rhs: Double) -> Double {
        lhs / rhs
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        lhs * rhs
    }
}
