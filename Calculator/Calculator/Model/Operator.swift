//
//  Operator.swift
//  Calculator
//
//  Created by Jae-hoon Sim on 2021/11/11.
//

import Foundation

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "-"
    case divide = "÷"
    case multiply = "×"
    
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
    
    private func add(lhs: Double, rhs: Double) -> Double {
        if lhs.isNaN || rhs.isNaN {
            return Double.nan
        }
        return lhs + rhs
    }
    private func subtract(lhs: Double, rhs: Double) -> Double {
        if lhs.isNaN || rhs.isNaN {
            return Double.nan
        }
        return lhs - rhs
    }
    private func divide(lhs: Double, rhs: Double) -> Double {
        if rhs == 0 || lhs.isNaN || rhs.isNaN {
            return Double.nan
        }
        return lhs / rhs
    }
    private func multiply(lhs: Double, rhs: Double) -> Double {
        if lhs.isNaN || rhs.isNaN {
            return Double.nan
        }
        return lhs * rhs
    }
}
