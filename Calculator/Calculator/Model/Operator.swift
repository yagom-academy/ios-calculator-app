//
//  Operator.swift
//  Calculator
//
//  Created by Jun Bang on 2021/11/12.
//

import Foundation

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "−"
    case divide = "÷"
    case multiply = "𝗑"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .add:
            return add(lhs, to: rhs)
        case .subtract:
            return subtract(rhs, from: lhs)
        case .divide:
            return divide(lhs, by: rhs)
        case .multiply:
            return multiply(lhs, with: rhs)
        }
    }
    
    private func add(_ lhs: Double, to rhs: Double) -> Double {
        return lhs + rhs
    }
    
    private func subtract(_ rhs: Double, from lhs: Double) -> Double {
        return lhs - rhs
    }
    
    private func divide(_ lhs: Double, by rhs: Double) -> Double {
        if rhs == 0 {
            return Double.nan
        }
        return lhs / rhs
    }
    
    private func multiply(_ lhs: Double, with rhs: Double) -> Double {
        return lhs * rhs
    }
}


