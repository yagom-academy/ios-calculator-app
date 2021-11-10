//
//  Operator.swift
//  Calculator
//
//  Created by 이승재 on 2021/11/10.
//

import Foundation

enum Operator: Character, CaseIterable, CalculatorItem {
    case add = "+"
    case subtract = "-"
    case devide = "/"
    case multiply = "*"
}

extension Operator {
    func calculate(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .add:
            return add(lhs: lhs, rhs: rhs)
        case .subtract:
            return subtract(lhs: lhs, rhs: rhs)
        case .devide:
            return devide(lhs: lhs, rhs: rhs)
        case .multiply:
            return multiply(lhs: lhs, rhs: rhs)
        }
    }
    private func add(lhs: Double, rhs: Double) -> Double {
        return 0.0
    }
    private func subtract(lhs: Double, rhs: Double) -> Double {
        return 0.0
    }
    private func devide(lhs: Double, rhs: Double) -> Double {
        return 0.0
    }
    private func multiply(lhs: Double, rhs: Double) -> Double {
        return 0.0
    }
}
