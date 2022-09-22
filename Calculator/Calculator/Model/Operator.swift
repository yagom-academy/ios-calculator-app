//
//  Operator.swift
//  Calculator
//
//  Created by 김인호 on 2022/09/22.
//

import Foundation

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "-"
    case divide = "%"
    case multiply = "*"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        return 0.0
    }
    
    private func add(lhs: Double, rhs: Double) -> Double {
        let result = lhs + rhs
        return result
    }
    
    private func subtract(lhs: Double, rhs: Double) -> Double {
        let result = lhs - rhs
        return result
    }
    
    private func divide(lhs: Double, rhs: Double) -> Double {
        let quotient = lhs / rhs
        let remainder = lhs.truncatingRemainder(dividingBy: rhs)
        let result = quotient + remainder
        return result
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        let result = lhs * rhs
        return result
    }
}
