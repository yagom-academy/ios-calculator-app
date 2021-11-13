//
//  Operator.swift
//  Calculator
//
//  Created by 예거 on 2021/11/09.
//

import Foundation

enum Operator: CalculateItem {
    case add
    case subtract
    case multiply
    case divide
    
    func calculate(_ lhs: Double, _ rhs: Double) -> Double {
        switch self {
        case .add:
            return add(lhs, rhs)
        case .subtract:
            return subtract(lhs, rhs)
        case .multiply:
            return multiply(lhs, rhs)
        case .divide:
            return divide(lhs, rhs)
        }
    }
    
    private func add(_ lhs: Double, _ rhs: Double) -> Double {
        return lhs + rhs
    }
    
    private func subtract(_ lhs: Double, _ rhs: Double) -> Double {
        return lhs - rhs
    }
    
    private func multiply(_ lhs: Double, _ rhs: Double) -> Double {
        return lhs * rhs
    }
    
    private func divide(_ lhs: Double, _ rhs: Double) -> Double {
        switch rhs {
        case 0:
            return Double.nan
        default:
            return lhs / rhs
        }
    }
}
