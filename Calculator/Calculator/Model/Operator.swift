//
//  Operator.swift
//  Calculator
//
//  Created by mmim.
//

import Foundation

enum Operator: CalculatorItem {
    case add
    case subtract
    case divide
    case multiply
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .add:
            return lhs + rhs
        case .subtract:
            return lhs - rhs
        case .divide:
            return lhs / rhs
        case .multiply:
            return lhs * rhs
        }
    }
    
    private func add(lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }
    
    private func subtract(lhs: Double, rhs: Double) -> Double {
        return lhs - rhs
    }
}
