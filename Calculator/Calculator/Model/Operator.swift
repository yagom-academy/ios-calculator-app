//
//  Operator.swift
//  Calculator
//

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "*"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
    }
    
    private func add(lhs: Double, rhs: Double) -> Double {
    }
    
    private func subtract(lhs: Double, rhs: Double) -> Double {
    }
    
    private func divide(lhs: Double, rhs: Double) -> Double {
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
    }
}
