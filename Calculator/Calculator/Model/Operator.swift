//
//  Operator.swift
//  Calculator
//
//  Created by Min Hyun on 2023/05/31.
//

enum Operator: Character, CaseIterable {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "*"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        return 0.0
    }
    private func add(lhs: Double, rhs: Double) -> Double {
        return 0.0
    }
    private func subtract(lhs: Double, rhs: Double) -> Double {
        return 0.0
    }
    private func divide(lhs: Double, rhs: Double) -> Double {
        return 0.0
    }
    private func multiply(lhs: Double, rhs: Double) -> Double {
        return 0.0
    }
}
