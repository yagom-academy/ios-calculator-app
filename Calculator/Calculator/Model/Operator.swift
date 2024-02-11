//
//  Operator.swift
//  Calculator
//
//  Created by Danny on 2/11/24.
//

import Foundation

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "*"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        switch self.rawValue {
        case "+":
            return add(lhs: lhs, rhs: rhs)
        case "-":
            return subtract(lhs: lhs, rhs: rhs)
        case "/":
            return divide(lhs: lhs, rhs: rhs)
        default:
            return multiply(lhs: lhs, rhs: rhs)
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
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
}
