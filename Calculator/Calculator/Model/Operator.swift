//
//  Operator.swift
//  Calculator
//
//  Created by mmim.
//

import Foundation

enum Operator: CalculatorItem {
    case plus
    case minus
    case divide
    case multiply
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .plus:
            return lhs + rhs
        case .minus:
            return lhs - rhs
        case .divide:
            return lhs / rhs
        case .multiply:
            return lhs * rhs
        }
    }
}
