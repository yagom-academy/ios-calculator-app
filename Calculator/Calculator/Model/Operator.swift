//
//  Operator.swift
//  Calculator
//
//  Created by Christy, Muri on 2023/01/30.
//

import Foundation

enum Operator: Character, CaseIterable {
    case add = "+"
    case subtract = "−"
    case divide = "÷"
    case multiply = "×"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        var result: Double
        switch self {
        case .add:
            result = add(lhs: lhs, rhs: rhs)
            return result
        case .subtract:
            result = subtract(lhs: lhs, rhs: rhs)
            return result
        case .divide:
            result = divide(lhs: lhs, rhs: rhs)
            return result
        case .multiply:
            result = multiply(lhs: lhs, rhs: rhs)
            return result
        }
    }
    
    private func add(lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }

    private func subtract(lhs: Double, rhs: Double) -> Double {
        return lhs - rhs
    }

    private func divide(lhs: Double, rhs: Double) -> Double {
        if rhs == 0 {
            return Double.nan
        }
        
        return lhs / rhs
    }

    private func multiply(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
}
