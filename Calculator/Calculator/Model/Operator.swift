//
//  Operator.swift
//  Calculator
//
//  Created by Hamo on 2022/09/26.
//

enum Operator: Character, CaseIterable {
    case add = "+"
    case subtract = "-"
    case divide = "%"
    case multiply = "*"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .add:
            return lhs + rhs
        case .subtract:
            return lhs - rhs
        case .divide:
            return lhs / rhs
        default:
            return 0.0
        }
    }
}
