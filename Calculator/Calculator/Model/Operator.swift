//
//  Operator.swift
//  Calculator
//
//  Created by Jusbug, Yetti on 2023/06/02.
//

enum Operator: Character, CaseIterable, CalculatorItem {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "*"
    
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

    func add(lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }

    func subtract(lhs: Double, rhs: Double) -> Double {
        return lhs - rhs
    }

    func divide(lhs: Double, rhs: Double) -> Double {
        let result = lhs / rhs
        return result.isInfinite ? .nan : result
    }

    func multiply(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
}

