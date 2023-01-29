//
//  Operator.swift
//  Calculator
//
//  Created by 혜모리 on 2023/01/27.
//

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "*"

    func calculate(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .add :
            return add(lhs: lhs, rhs: rhs)
        case .subtract :
            return subtract(lhs: lhs, rhs: rhs)
        case .divide :
            return divide(lhs: lhs, rhs: rhs)
        case .multiply :
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
        guard rhs != 0 else { return .nan }
        return lhs / rhs
    }

    func multiply(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
}
