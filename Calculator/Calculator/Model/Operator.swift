//
//  Operator.swift
//  Calculator
//
//  Created by 임지성 on 2021/11/11.
//

import Foundation

enum Operator: Character, CaseIterable {
    case add = "+"
    case substract = "-"
    case divide = "/"
    case multiply = "×"

    func calculate(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .add: return add(lhs: 0.0, rhs: 0.0)
        case .divide: return substract(lhs: 0.0, rhs: 0.0)
        case .multiply: return multiply(lhs: 0.0, rhs: 0.0)
        case .substract: return substract(lhs: 0.0, rhs: 0.0)
        }
    }

    private func add(lhs: Double, rhs: Double) -> Double {
        return 0.0
    }

    private func substract(lhs: Double, rhs: Double) -> Double {
        return 0.0
    }

    private func divide(lhs: Double, rhs: Double) -> Double {
        return 0.0
    }

    private func multiply(lhs: Double, rhs: Double) -> Double {
        return 0.0
    }
}

