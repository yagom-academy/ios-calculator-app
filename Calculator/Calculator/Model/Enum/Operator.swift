//
//  Operator.swift
//  Calculator
//
//  Created by dragon on 2022/09/23.
//

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "*"
    
    public func calculate(lhs: Double, rhs: Double) -> Double {
        let result = 0.0
        return result
    }
    
    private func add(lhs: Double, rhs: Double) -> Double {
        return (lhs+rhs)
    }
    
    private func subtract(lhs: Double, rhs: Double) -> Double {
        return (lhs-rhs)
    }
    
    private func divide(lhs: Double, rhs: Double) -> Double {
        return (lhs/rhs)
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
       return (lhs*rhs)
    }
}
