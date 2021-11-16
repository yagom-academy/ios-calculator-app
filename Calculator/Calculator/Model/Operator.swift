//
//  Operator.swift
//  Calculator
//
//  Created by yeha on 2021/11/15.
//

import Foundation

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "_"
    case divide = "/"
    case multiply = "*"
    
    func calculate(_ lhs: Double, _ rhs: Double) -> Double {
        switch self {
        case .add:
            return add(lhs, rhs)
        case .subtract:
            return substract(lhs, rhs)
        case .divide:
            return divide(lhs, rhs)
        case .multiply:
            return multiply(lhs, rhs)
        }
    }
    
    private func add(_ lhs: Double, _ rhs: Double) -> Double {
        return lhs + rhs
    }
    
    private func substract(_ lhs: Double, _ rhs: Double) -> Double {
        return lhs - rhs
    }
    
    private func divide(_ lhs: Double, _ rhs: Double) -> Double {
        return lhs / rhs
    }
    
    private func multiply(_ lhs: Double, _ rhs: Double) -> Double {
        return lhs * rhs
    }
}
