//
//  Operator.swift
//  Calculator
//
//  Created by 서현웅 on 2022/09/22.
//

import Foundation

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "*"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        return 0
    }
    
    func add(lhs: Double, rhs: Double) -> Double {
        return 0
    }
    
    func subtract(lhs: Double, rhs: Double) -> Double {
        return 0
    }
    
    func divide(lhs: Double, rhs: Double) -> Double {
        return 0
    }
    
    func multiply(lhs: Double, rhs: Double) -> Double {
        return 0
    }
}
