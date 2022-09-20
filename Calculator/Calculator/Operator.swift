//
//  Operator.swift
//  Calculator
//
//  Created by LJ on 2022/09/20.
//

import Foundation

enum Operator: String {
    case plus
    case minus
    case multiplication
    case division
    
    func operate(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .plus:
            return lhs + rhs
        case .minus:
            return lhs - rhs
        case .multiplication:
            return lhs * rhs
        case .division:
            return lhs / rhs
        }
    }
}
