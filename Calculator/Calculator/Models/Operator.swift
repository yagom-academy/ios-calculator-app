//
//  Operator.swift
//  Calculator
//
//  Created by Charles on 2023/10/08.
//

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "*"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        return 0
    }
    
    private func add(lhs: Double, rhs: Double) -> Double {
        return 0
    }
    
    private func subtract(lhs: Double, rhs: Double) -> Double {
        return 0
    }
    
    private func divide(lhs: Double, rhs: Double) -> Double {
        return 0
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        return 0
    }
}
