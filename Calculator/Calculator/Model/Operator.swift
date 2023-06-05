//
//  Operator.swift
//  Calculator
//
//  Created by 박종화 on 2023/06/02.
//

import Foundation

enum Operator: CaseIterable {
    case add
    case subtract
    case divide
    case multifly
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .add:
            return add(lhs: lhs, rhs: rhs)
        case .subtract:
            return subtract(lhs: lhs, rhs: rhs)
        case .divide:
            return divide(lhs: lhs, rhs: rhs)
        case .multifly:
            return multifly(lhs: lhs, rhs: rhs)
        }
    }

    func add(lhs: Double, rhs: Double) -> Double {
        result = lhs + rhs
        return result
    }

    func subtract(lhs: Double, rhs: Double) -> Double {
        result = lhs - rhs
        return result
    }

    func divide(lhs: Double, rhs: Double) -> Double {
        result = lhs / rhs
        return result
    }

    func multifly(lhs: Double, rhs: Double) -> Double {
        result = lhs * rhs
        return result
    }
}


