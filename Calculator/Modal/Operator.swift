//
//  Operator.swift
//  Calculator
//
//  Created by 우롱차 on 2022/03/18.
//

import Foundation

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "*"
    
    func calculate(lhs: Double?, rhs: Double?) -> Double? {
        guard let doubleLhs = lhs, let doubleRhs = rhs else {
            return nil
        }
        switch self {
            
        case .add:
            return add(lhs: doubleLhs, rhs: doubleRhs)
        case .subtract:
            return subtract(lhs: doubleLhs, rhs: doubleRhs)
        case .divide:
            return divide(lhs: doubleLhs, rhs: doubleRhs)
        case .multiply:
            return multiply(lhs: doubleLhs, rhs: doubleRhs)
        }
    }
    
    private func add(lhs: Double, rhs: Double) -> Double? {
        return lhs + rhs
    }
    
    private func subtract(lhs: Double, rhs: Double) -> Double? {
        return lhs - rhs
    }
    
    private func divide(lhs: Double, rhs: Double) -> Double? {
        if rhs == 0 {
            return nil
        }
        return lhs / rhs
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double? {
        return lhs * rhs
    }
}
