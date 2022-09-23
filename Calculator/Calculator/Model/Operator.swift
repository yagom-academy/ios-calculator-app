//
//  Operator.swift
//  Calculator
//
//  Created by junho lee on 2022/09/23.
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
